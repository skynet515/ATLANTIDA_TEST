using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Atlantida_Web_Aplication.App_Code;
using Atlantida_Web_Aplication.Models;

namespace Atlantida_Web_Aplication.Controllers
{
    public class LoginController : Controller
    {
        public SessionHelperEnLinea contenedorHelper = new SessionHelperEnLinea();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GrabarSesion(ContentSessionExterno usuario)
        {
            if (usuario != null)
            {
                contenedorHelper.SetContenedor(usuario);
                contenedorHelper.lockSessions(HttpContext);
                return Json(new { request = true });
            }else
                return Json(new { request = false });
            
        }

        public ActionResult Logout()
        {
            contenedorHelper.ReleaseSession();
            return RedirectToAction("Index", "Login");
        }
    }
}