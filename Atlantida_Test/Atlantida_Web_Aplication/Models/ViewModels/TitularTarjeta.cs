using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Atlantida_Web_Aplication.Models.ViewModels
{
    public class TitularTarjeta
    {
        public int idTarjeta { get; set; }
        public string Titular { get; set; }
        public string Tarjeta { get; set; }
        public double Saldo { get; set; }
        public double SaldoDisponible { get; set; }
        public double LimiteCrediticio { get; set; }
    }
}