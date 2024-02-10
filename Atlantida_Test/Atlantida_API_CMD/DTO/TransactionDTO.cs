namespace Atlantida_API_CMD.DTO
{
    public class TransactionDTO
    {
        public int idTarjeta { get; set; }
        public int idTipoTransaccion { get; set; }
        public double monto { get; set; }
        public string? descripcion { get; set; }
    }
}
