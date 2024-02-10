using Atlantida_API_Querys.DTO;

namespace Atlantida_API_Querys.Repository.Interfaces
{
    public interface IHistoricoTransacciones
    {
        List<HistoricoTransaccionesDTO> TransaccionesMensuales(TarjetaDTO tarjeta);
        List<ComprasDTO> ComprasMensuales(TarjetaDTO tarjeta);
    }
}
