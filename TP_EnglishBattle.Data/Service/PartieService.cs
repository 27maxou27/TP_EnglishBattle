using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TP_EnglishBattle.Data.Models;

namespace TP_EnglishBattle.Data.Service
{
    public class PartieService
    {
        private JoueurService _joueurService;
        private QuestionService _questionService;
        private VerbeService _verbeService;

        public PartieService()
        {
            _joueurService = new JoueurService();
            _questionService = new QuestionService();
            _verbeService = new VerbeService();
        }

        public Partie NouvellePartie(string email)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                var joueur = _joueurService.GetItem(email);

                Partie partie = new Partie
                {
                    idJoueur = joueur.id,
                    score = 0,
                };

                ctx.Partie.Add(partie);
                ctx.SaveChanges();

                return (partie);
            }
        }

        public bool InsertReponse(Question reponse)
        {
            if (IsReponseValide(reponse))
            {
                using (var ctx = new EnglishBattle2Entities())
                {
                    var partie = ctx.Partie.Find(reponse.idPartie);

                    if (partie != null)
                    {
                        partie.score++;
                    }

                    _questionService.Insert(reponse);

                    ctx.SaveChanges();

                    return (true);
                }
            }

            return (false);
        }

        private bool IsReponseValide(Question reponse)
        {
            if (reponse == null)
            {
                return false;
            }

            bool result = _verbeService.IsVerbeValid(reponse.idVerbe, reponse.reponsePreterit, reponse.reponseParticipePasse);

            return (result);
        }

        public List<VerbeClient> GetListeVerbes()
        {
            var tmp = _verbeService.GetVerbes();

            var list = new List<VerbeClient>();

            // Besoin du VerbeClient pour serializer en JSON
            tmp.ForEach(verbe => list.Add(new VerbeClient
            {
                id = verbe.id,
                baseVerbale = verbe.baseVerbale,
                preterit = verbe.preterit,
                participePasse = verbe.participePasse,
            }));

            return (list);
        }
    }
}
