using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Repository.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Atlantida_API_Querys.Controllers
{
    [Route("querys/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        ISesion sesion;

        public UsuarioController(ISesion sesion)
        {
            this.sesion = sesion;
        }

        [HttpPost]
        [Route("Login")]
        public IActionResult Login([FromBody] ValidarCredencialesDTO credenciales)
        {
            try
            {
                ContentSesionExternoDTO usuario = sesion.ObtenerUsuario(credenciales);

                if (usuario != null)
                {
                    return StatusCode(StatusCodes.Status200OK, usuario);
                }
                else
                    return StatusCode(StatusCodes.Status400BadRequest, new { message = "Sesion Failded" });
            }
            catch(Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.Message });
            }
        }
    }
}
