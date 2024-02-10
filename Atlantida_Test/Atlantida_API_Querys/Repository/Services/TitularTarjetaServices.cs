using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Models;
using Atlantida_API_Querys.Models.Commands;
using Atlantida_API_Querys.Repository.Interfaces;
using AutoMapper;
using Microsoft.Data.SqlClient;

namespace Atlantida_API_Querys.Repository.Services
{
    public class TitularTarjetaServices : ITitularTarjeta
    {
        private readonly IMapper _mapper;
        private readonly AtlantidaDB_Context _dbContext;

        public TitularTarjetaServices(IMapper mapper, AtlantidaDB_Context dbContext)
        {
            _mapper = mapper;
            _dbContext = dbContext;
        }

        public List<TitularTarjetaDTO> DatosTitular(PersonaDTO persona)
        {
            Commands cmd = new Commands(_dbContext);
            List<TitularTarjetaDTO> dto = new List<TitularTarjetaDTO>();
            SqlParameter parameter = new SqlParameter("@idPersona", persona.idPersona);
            List<TitularTarjeta>? tr = cmd.ExecuteSqlCommandList<TitularTarjeta>("EXEC ATLA_SP_TitularTarjeta @idPersona", parameter);
            if (tr != null)
            {
                dto = _mapper.Map<List<TitularTarjeta>, List<TitularTarjetaDTO>>(tr);
            }

            return dto;
        }
    }
}
