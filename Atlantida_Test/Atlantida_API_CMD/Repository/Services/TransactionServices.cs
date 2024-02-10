using Atlantida_API_CMD.DTO;
using Atlantida_API_CMD.Models;
using Atlantida_API_CMD.Models.Commands;
using Atlantida_API_CMD.Repository.Interfaces;
using AutoMapper;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Atlantida_API_CMD.Repository.Services
{
    public class TransactionServices : ITransaction
    {
        private readonly IMapper _mapper;
        private readonly AtlantidaDB_Context _dbContext;

        public TransactionServices(IMapper mapper, AtlantidaDB_Context dbContext)
        {
            _mapper = mapper;
            _dbContext = dbContext;
        }

        public int InsertarTransaction(TransactionDTO tr)
        {
            int idTransaccion = 0;
            using (var t = _dbContext.Database.BeginTransaction())
            {
                try
                {
                    Commands cmd = new Commands(_dbContext);
                    // Definir los parámetros para la ejecución del procedimiento almacenado
                    SqlParameter[] parametersTransaccion = new SqlParameter[]
                    {
                    new SqlParameter("@idTarjeta", tr.idTarjeta),
                    new SqlParameter("@idTipoTransaccion", tr.idTipoTransaccion),
                    new SqlParameter("@monto", tr.monto),
                    new SqlParameter("@idTransaccion", SqlDbType.Int) { Direction = ParameterDirection.Output }
                    };

                    // Ejecutar el procedimiento almacenado
                    int filasEncabezado = cmd.ExecuteSqlCommand("exec ATLA_SP_InsertarTransaccion @idTarjeta, @idTipoTransaccion, @monto, @idTransaccion OUTPUT", parametersTransaccion);

                    // Obtener el ID de transacción generado
                    idTransaccion = (int)parametersTransaccion[3].Value;

                    if (idTransaccion > 1)
                    {
                        SqlParameter[] parametersDetalle = new SqlParameter[]
                        {
                            new SqlParameter("@idTransaccion", idTransaccion),
                            new SqlParameter("@descripcion", tr.descripcion),
                            new SqlParameter("@monto", tr.monto),
                            new SqlParameter("@idDetalle", SqlDbType.Int) { Direction = ParameterDirection.Output }
                        };

                        int filasDetalle = cmd.ExecuteSqlCommand("EXEC ATLA_SP_InsertarDetalleTransacion @idTransaccion, @descripcion, @monto, @idDetalle OUTPUT", parametersDetalle);
                        int idDetalle = (int)parametersDetalle[3].Value;


                        if (idDetalle > 1)
                        {
                            SqlParameter[] parametersSaldo = new SqlParameter[]
                            {
                                new SqlParameter("@idTipoTransaccion", tr.idTipoTransaccion),
                                new SqlParameter("@idTarjeta", tr.idTarjeta),
                                new SqlParameter("@monto", tr.monto),
                                new SqlParameter("@idTarjetaModificado", SqlDbType.Int) { Direction = ParameterDirection.Output }

                            };

                            int idTarjeta = cmd.ExecuteSqlCommand("EXEC ATLA_SP_ActualizarSaldo @idTipoTransaccion, @idTarjeta, @monto, @idTarjetaModificado OUTPUT", parametersSaldo);

                            int saldoModificado = (int)parametersSaldo[3].Value;

                            if (saldoModificado > 0)
                            {
                                t.Commit();
                            }
                            else
                            {

                                t.Rollback();
                                idTransaccion = 0;
                            }
                        }
                        else
                        {
                            t.Rollback();
                            idTransaccion = 0;
                        }

                    }
                    else
                    {
                        t.Rollback();
                        idTransaccion = 0;
                    }
                }
                catch
                {
                    t.Rollback();
                    idTransaccion = 0;
                }

            }

            return idTransaccion;
        }
    }
}
