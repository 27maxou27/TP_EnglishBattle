using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_EnglishBattle.Data;
using TP_EnglishBattle.Data.Service;

namespace TP_EnglishBattle
{
    public partial class Register1 : System.Web.UI.Page
    {
        private JoueurService _service;

        protected void Page_Init(object sender, EventArgs e)
        {
            _service = new JoueurService();
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

            }
        }

        protected void Btn_submit_OnClick(object sender, EventArgs e)
        {
            Page.Validate();

            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                Joueur joueur = new Joueur()
                {
                    nom = txt_nom.Text,
                    prenom = txt_prenom.Text,
                    email = txt_email.Text,
                    motDePasse = txt_mdp.Text,
                    niveau = Convert.ToInt32(ddl_niveau.SelectedValue),
                    idVille = Convert.ToInt32(ddl_ville.SelectedValue),
                };

                _service.Insert(joueur);

                FormsAuthentication.SetAuthCookie(txt_email.Text, true);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}