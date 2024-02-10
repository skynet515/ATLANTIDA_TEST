using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Models;
using Atlantida_API_Querys.Models.Commands;
using Atlantida_API_Querys.Repository.Interfaces;
using AutoMapper;
using Microsoft.Data.SqlClient;

namespace Atlantida_API_Querys.Repository.Services
{
    public class HistoricoTransaccionesServices: IHistoricoTransacciones
    {
        private readonly IMapper _mapper;
        private readonly AtlantidaDB_Context _dbContext;

        public HistoricoTransaccionesServices(IMapper mapper, AtlantidaDB_Context dbContext)
        {
            _mapper = mapper;
            _dbContext = dbContext;
        }

        public List<ComprasDTO> ComprasMensuales(TarjetaDTO tarjeta)
        {
            List<ComprasDTO> lst = new List<ComprasDTO>();
            Commands cmd = new Commands(_dbContext);
            SqlParameter parameter = new SqlParameter("@idTarjeta", tarjeta.idTarjeta);
            List<Compras> lstCompras = cmd.ExecuteSqlCommandList<Compras>("EXEC ATLA_SP_Compras @idTarjeta", parameter);
            lst = _mapper.Map<List<Compras>, List<ComprasDTO>>(lstCompras);
            return lst;
        }

        public List<HistoricoTransaccionesDTO> TransaccionesMensuales(TarjetaDTO tarjeta)
        {
            List<HistoricoTransaccionesDTO> lst = new List<HistoricoTransaccionesDTO>();
            Commands cmd = new Commands(_dbContext);
            SqlParameter parameter = new SqlParameter("@idTarjeta", tarjeta.idTarjeta);
            List<HistoricoTransacciones> lstHis = cmd.ExecuteSqlCommandList<HistoricoTransacciones>("EXEC ATLA_SP_HistoricoTransacciones @idTarjeta", parameter);
            lst = _mapper.Map<List<HistoricoTransacciones>, List<HistoricoTransaccionesDTO>>(lstHis);

            return lst;
        }
    }
}
