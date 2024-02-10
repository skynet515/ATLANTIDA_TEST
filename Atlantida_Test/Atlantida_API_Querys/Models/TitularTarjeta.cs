namespace Atlantida_API_Querys.Models
{
    public class TitularTarjeta
    {
        public int idTarjeta { get; set; }
        public string? Titular { get; set; }
        public string? Tarjeta { get; set; }
        public double Saldo { get; set; }
        public double SaldoDisponible { get; set; }
        public double LimiteCrediticio { get; set; }
    }
}
