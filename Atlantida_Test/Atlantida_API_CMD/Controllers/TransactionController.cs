using Atlantida_API_CMD.DTO;
using Atlantida_API_CMD.Repository.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Atlantida_API_CMD.Controllers
{
    [Route("cmd/[controller]")]
    [ApiController]
    public class TransactionController : ControllerBase
    {
        ITransaction transaction;

        public TransactionController(ITransaction transaction)
        {
            this.transaction = transaction;
        }

        [HttpPost]
        [Route("Transaction")]
        public IActionResult InsertTransaction([FromBody] TransactionDTO trx)
        {
            try
            {
                int registro = transaction.InsertarTransaction(trx);
                if (registro != 0)
                    return StatusCode(StatusCodes.Status200OK, new { message = "OK" });
                else
                    return StatusCode(StatusCodes.Status400BadRequest, new { message = "FAILED" });


            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.Message });
            }
        }
    }
}
