using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Models;
using Atlantida_API_Querys.Models.Commands;
using Atlantida_API_Querys.Repository.Interfaces;
using AutoMapper;
using Microsoft.Data.SqlClient;

namespace Atlantida_API_Querys.Repository.Services
{
    public class SesionServices: ISesion
    {
        private readonly IMapper _mapper;
        private readonly AtlantidaDB_Context _dbContext;

        public SesionServices(IMapper mapper, AtlantidaDB_Context dbContext)
        {
            _mapper = mapper;
            _dbContext = dbContext;
        }

        public ContentSesionExternoDTO ObtenerUsuario(ValidarCredencialesDTO usuario)
        {
            ContentSesionExternoDTO sesion = new ContentSesionExternoDTO();
            Commands cmd = new Commands(_dbContext);
            SesionDTO dto = new SesionDTO();
            SqlParameter parameter = new SqlParameter("@nombreUsuario", usuario.nombreUsuario);
            Sesion? user = cmd.ExecuteSqlCommand<Sesion>("ATLA_SP_ObtenerUsuario @nombreUsuario", parameter).FirstOrDefault();

            if (user != null)
            {
                if (usuario.clave == user.Clave)
                {
                    dto = _mapper.Map<Sesion, SesionDTO>(user);

                    //Se arma menu
                    SqlParameter parameterMenu = new SqlParameter("@nombreUsuario", usuario.nombreUsuario);
                    List<Menu> menu = cmd.ExecuteSqlCommandList<Menu>("EXEC ATLA_SP_ObtenerMenuxRol @nombreUsuario", parameterMenu);
                    sesion.sesion = dto;
                    sesion.menu = menu;
                }
                else
                    sesion = null;
            }

            return sesion;
        }
    }
}
