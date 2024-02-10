namespace Atlantida_API_Querys.Models
{
    public class Sesion
    {
        public int idPersona { get; set; }
        public int idUsuario { get; set; }
        public string? NombreCompleto { get; set; }
        public string? NombreUsuario { get; set; }
        public string? Clave { get; set; }
    }
}
