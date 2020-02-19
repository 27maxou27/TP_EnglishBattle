using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using TP_EnglishBattle.Data;
using TP_EnglishBattle.Data.Service;

namespace TP_EnglishBattle
{
    public partial class Register : System.Web.UI.Page
    {
        private JoueurService _joueurService;
        private VilleService _villeService;

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                Response.Redirect("Default.aspx", true);
                Context.ApplicationInstance.CompleteRequest();
            }

            _joueurService = new JoueurService();
            _villeService = new VilleService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    ddl_ville.DataSource = _villeService.GetList();
                    ddl_ville.DataTextField = "nom";
                    ddl_ville.DataValueField = "id";
                    ddl_ville.DataBind();
                    ddl_ville.Items.Insert(0, new ListItem("-- Choisir Ville --", ""));
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        protected void ResetErrors()
        {
            err_email.Visible = false;
        }

        protected void Btn_submit_OnClick(object sender, EventArgs e)
        {
            ResetErrors();
            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                if (_joueurService.IsEmailUsed(txt_email.Text))
                {
                    err_email.Visible = true;
                    return;
                }

                Joueur joueur = new Joueur()
                {
                    nom = txt_nom.Text,
                    prenom = txt_prenom.Text,
                    email = txt_email.Text,
                    motDePasse = txt_mdp.Text,
                    niveau = Convert.ToInt32(ddl_niveau.SelectedValue),
                    idVille = Convert.ToInt32(ddl_ville.SelectedValue),
                };

                _joueurService.Insert(joueur);

                Session.Add("added_user", joueur.email);
                FormsAuthentication.RedirectToLoginPage();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}