using System;
using System.Collections.Generic;
using System.Diagnostics;
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
                Response.Redirect("Default.aspx", true);
                Context.ApplicationInstance.CompleteRequest();
            }

            _joueurService = new JoueurService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["added_user"] != null)
                {
                    user_email.InnerText = Session["added_user"] as string;
                    alert_success.Visible = true;
                    Session.Remove("added_user");
                }
                if (Session["login_error"] != null)
                {
                    alert_failure.Visible = true;
                    Session.Remove("login_error");
                }
                if (Session["conn_error"] != null)
                {
                    alert_conn_failure.Visible = true;
                    lbl_conn_failure.Text = Session["conn_error"].ToString();
                    Session.Remove("conn_error");
                }
            }
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
                    Session["logged_user"] = joueur.email;

                    //FormsAuthentication.SetAuthCookie(joueur.email, cb_remember.Checked); // Inutile
                    FormsAuthentication.RedirectFromLoginPage(joueur.email, cb_remember.Checked);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    Session["login_error"] = true;
                    Response.Redirect("Login.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            catch (Exception ex)
            {
                Session["conn_error"] = $"Il y a eu une erreur lors de la tentative de liaison avec la base de données. {ex.ToString()}";
                Response.Redirect("Login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
    }
}