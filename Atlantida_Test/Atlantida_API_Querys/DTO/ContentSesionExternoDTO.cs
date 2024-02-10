using Atlantida_API_Querys.Models;

namespace Atlantida_API_Querys.DTO
{
    public class ContentSesionExternoDTO
    {
        public SesionDTO? sesion { get; set; }
        public List<Menu> menu { get; set; }

    }
}
