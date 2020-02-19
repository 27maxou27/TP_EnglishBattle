using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TP_EnglishBattle.Data.Service;
using TP_EnglishBattle.Data;
using Newtonsoft.Json;
using System.Diagnostics;
using TP_EnglishBattle.Data.Models;

namespace TP_EnglishBattle
{
    public partial class _Default : Page
    {
        private static PartieService _partieService;
        private static Partie _partie;

        private JoueurService _joueurService;
        private Joueur _joueur;

        private void Page_Init(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("/Login");
            }

            FormsIdentity ident = User.Identity as FormsIdentity;

            _joueurService = new JoueurService();
            _joueur = _joueurService.GetItem(ident.Name);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _partieService = new PartieService();
            }
            else
            {
                if (!string.IsNullOrEmpty(Request["__EVENTTARGET"]) && Request["__EVENTTARGET"] == "GAME_OVER")
                {
                    game_panel.Visible = false;
                    newgame_panel.Visible = false;
                    gameover_panel.Visible = true;
                }
            }
        }

        protected void StartGame()
        {
            _partie = _partieService.NouvellePartie(_joueur.email);

            // Champs cachés contenant les informations basiques sur la partie
            hf_id_joueur.Value = _joueur.id.ToString();
            hf_niveau.Value = _joueur.niveau.ToString();
            hf_id_partie.Value = _partie.id.ToString();

            Debug.WriteLine($"{hf_id_joueur.Value}, {hf_niveau.Value}, {hf_id_partie.Value}");

            // Affiche/cache les panels du jeu
            game_panel.Visible = true;
            gameover_panel.Visible = false;
            newgame_panel.Visible = false;
        }

        protected void EndGame()
        {
            //int finalScore = _partieService.GetScoreFinal(_partie.id);

            gameover_panel.Visible = true;
            game_panel.Visible = false;
            newgame_panel.Visible = false;
        }

        protected void Btn_newgame_Click(object sender, EventArgs e)
        {
            StartGame();
        }

        #region AJAX Handlers

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool PostReponse(Question reponse)
        {
            Debug.WriteLine(reponse.idPartie);
            Debug.WriteLine(reponse.idVerbe);
            Debug.WriteLine(reponse.reponsePreterit);
            Debug.WriteLine(reponse.reponseParticipePasse);
            Debug.WriteLine(reponse.dateEnvoie);
            Debug.WriteLine(reponse.dateReponse);

            // Insère la réponse en base et récupère le status de la réponse
            bool check = _partieService.InsertReponse(reponse);

            return (check);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetListeVerbes()
        {
            Debug.WriteLine("\nLa liste de verbes à été retournée\n");
            List<VerbeClient> listeVerbes = _partieService.GetListeVerbes();

            // Convertit la liste de verbes en JSON pour envoyer au JavaScript en front
            string listeVerbesJSON = JsonConvert.SerializeObject(listeVerbes.ToArray());

            return ($@"{listeVerbesJSON}");
        }

        #endregion
    }
}