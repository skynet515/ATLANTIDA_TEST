using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Repository.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Atlantida_API_Querys.Controllers
{
    [Route("querys/[controller]")]
    [ApiController]
    public class TitularTarjetaController : ControllerBase
    {
        ITitularTarjeta tarjeta;

        public TitularTarjetaController(ITitularTarjeta tarjeta)
        {
            this.tarjeta = tarjeta;
        }

        [HttpPost]
        [Route("Titular")]
        public IActionResult DatosTitular(PersonaDTO persona)
        {
            try
            {
                List<TitularTarjetaDTO> dto = tarjeta.DatosTitular(persona);
                if (dto != null)
                {
                    return StatusCode(StatusCodes.Status200OK, dto);
                }
                else
                    return StatusCode(StatusCodes.Status400BadRequest, dto);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.Message });
            }
        }
    }
}
