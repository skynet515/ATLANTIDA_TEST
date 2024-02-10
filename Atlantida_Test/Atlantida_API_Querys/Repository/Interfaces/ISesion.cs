using Atlantida_API_Querys.DTO;

namespace Atlantida_API_Querys.Repository.Interfaces
{
    public interface ISesion
    {
        ContentSesionExternoDTO ObtenerUsuario(ValidarCredencialesDTO credenciales);
    }
}
