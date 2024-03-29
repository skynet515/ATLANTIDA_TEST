﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Atlantida_Web_Aplication.Comun
{
    public class Utility
    {
        public static string getBaseUrl(string url = "")
        {
            string baseUrl = "";

            try
            {
                var currentUrl = HttpContext.Current.Request.Url;
                var appUrl = HttpRuntime.AppDomainAppVirtualPath;

                //Se construye la url base del proyecto
                baseUrl += currentUrl.Scheme;
                baseUrl += "://" + currentUrl.Authority;

                baseUrl += (appUrl != "/") ? appUrl + "/" : appUrl;

                if (url != "")
                {
                    baseUrl += url.TrimStart('/');
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return baseUrl;
        }

        public static string getValorWebConfig(string keyParametro)
        {
            string valorParametro = "";

            try
            {
                valorParametro = ConfigurationManager.AppSettings[keyParametro];
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return valorParametro;
        }
    }
}