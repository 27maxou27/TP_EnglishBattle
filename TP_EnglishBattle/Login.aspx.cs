using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_EnglishBattle.Data.Service;

namespace TP_EnglishBattle
{
    public partial class Login : System.Web.UI.Page
    {
        private JoueurService _joueurService;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                if (Session["added_user"] != null)
                {
                    alert_email.InnerText = Session["added_user"] as string;
                    alert_success.Visible = true;
                    Session.Remove("added_user");
                }
            }

            _joueurService = new JoueurService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_OnClick(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                var joueur = _joueurService.GetItem(txt_email.Text, txt_mdp.Text);

                if (joueur != null)
                {
                    Session.Add("logged_user", joueur);
                    FormsAuthentication.SetAuthCookie(txt_email.Text, cb_remember.Checked);
                    Response.Redirect("Default.aspx");
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}