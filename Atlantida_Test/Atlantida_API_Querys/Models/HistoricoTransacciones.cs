namespace Atlantida_API_Querys.Models
{
    public class HistoricoTransacciones
    {
        public DateTime FechaRegistro { get; set; }
        public string? Tipo { get; set; }
        public string? Descripcion { get; set; }
        public double Monto { get; set; }
    }
}
