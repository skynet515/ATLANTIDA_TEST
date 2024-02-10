using Atlantida_Web_Aplication.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Atlantida_Web_Aplication.Models
{
    public class ContentSessionExterno
    {
        public Sesion sesion { get; set; }
        public List<Menu> menu { get; set; }
    }
}