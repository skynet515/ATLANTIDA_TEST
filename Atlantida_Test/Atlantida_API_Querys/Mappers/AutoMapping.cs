using Atlantida_API_Querys.DTO;
using Atlantida_API_Querys.Models;
using AutoMapper;

namespace Atlantida_API_Querys.Mappers
{
    public class AutoMapping:Profile
    {
        public AutoMapping()
        {
            CreateMap<Sesion, SesionDTO>();
            CreateMap<HistoricoTransacciones, HistoricoTransaccionesDTO>();
            CreateMap<Compras, ComprasDTO>();
            CreateMap<TitularTarjeta,  TitularTarjetaDTO>();
        }
    }
}
