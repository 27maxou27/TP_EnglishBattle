using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace TP_EnglishBattle
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();

            // Ligne retirée car elle bloque les requêtes AJAX
            //settings.AutoRedirectMode = RedirectMode.Permanent;

            routes.EnableFriendlyUrls(settings);
        }
    }
}
