using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using TP_EnglishBattle.Data;

namespace TP_EnglishBattle
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //HttpCookie authcookie = Request.Cookies[FormsAuthentication.FormsCookieName];

            //if (authcookie != null)
            //{
            //    if (Session["logged_user"] == null)
            //    {
            //        FormsAuthenticationTicket authticket = FormsAuthentication.Decrypt(authcookie.Value);

            //        if (!authticket.IsPersistent)
            //        {
            //            FormsAuthentication.SignOut();
            //            FormsAuthentication.RedirectToLoginPage();
            //        }
            //        else
            //        {
            //            Session["logged_user"] = authticket.Name;
            //        }
            //    }
            //}
        }

        protected void Lkb_disconnect_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}