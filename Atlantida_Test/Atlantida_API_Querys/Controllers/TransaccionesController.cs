using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Repository.Interfaces;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Atlantida_API_Querys.Controllers
{
    [Route("querys/[controller]")]
    [ApiController]
    public class TransaccionesController : ControllerBase
    {
        IHistoricoTransacciones transacciones;

        public TransaccionesController(IHistoricoTransacciones transacciones)
        {
            this.transacciones = transacciones;
        }


        [HttpPost]
        [Route("ListTransacciones")]
        public IActionResult TransaccionesMensuales(TarjetaDTO tarjeta)
        {
            try
            {
                List<HistoricoTransaccionesDTO> lst = new List<HistoricoTransaccionesDTO>();

                lst = transacciones.TransaccionesMensuales(tarjeta);
                if (lst.Count >= 0)
                {
                    return StatusCode(StatusCodes.Status200OK, lst);
                }
                else
                    return StatusCode(StatusCodes.Status400BadRequest, lst);

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.Message });
            }
        }

        [HttpPost]
        [Route("ListCompras")]
        public IActionResult ComprasMensuales(TarjetaDTO tarjeta)
        {
            try
            {
                List<ComprasDTO> lst = new List<ComprasDTO>();
                lst = transacciones.ComprasMensuales(tarjeta);
                if (lst.Count >= 0)
                {
                    return StatusCode(StatusCodes.Status200OK, lst);              }
                else
                    return StatusCode(StatusCodes.Status400BadRequest, lst);

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.Message });
            }
        }

    }
}
