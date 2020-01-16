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
        public Joueur _joueur;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (Session["logged_user"] != null) {
                    _joueur = Session["logged_user"] as Joueur;
                }
            }
        }

        protected void lkb_disconnect_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}