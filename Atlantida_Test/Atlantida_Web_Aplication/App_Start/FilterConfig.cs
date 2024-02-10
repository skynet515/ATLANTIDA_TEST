using System.Web;
using System.Web.Mvc;

namespace Atlantida_Web_Aplication
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
