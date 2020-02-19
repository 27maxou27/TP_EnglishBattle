using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    public class JoueurService
    {
        public JoueurService()
        {

        }

        public Joueur GetItem(string email)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                var joueur = ctx.Joueur.Where(j => j.email == email).First();

                return joueur;
            }
        }

        public Joueur GetItem(string email, string mdp)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                var joueur = ctx.Joueur.FirstOrDefault(x => x.email == email && x.motDePasse == mdp);

                return (joueur);
            }
        }

        public bool IsEmailUsed(string email)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                return (ctx.Joueur.Where(x => x.email == email)).Any();
            }
        }

        public void Insert(Joueur joueur)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                ctx.Joueur.Add(joueur);
                ctx.SaveChanges();
            }
        }

        public List<Joueur> GetList()
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                var list = ctx.Joueur.ToList();

                return (list);
            }
        }

        public void Update(Joueur joueur)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                ctx.Entry(joueur).State = EntityState.Modified;
                ctx.SaveChanges();
            }
        }

        public void Delete(Joueur joueur)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                ctx.Joueur.Attach(joueur);

                var parties = joueur.Partie;

                foreach (var partie in parties)
                {
                    var questions = partie.Question;

                    ctx.Question.RemoveRange(questions);
                }

                ctx.Partie.RemoveRange(parties);
                ctx.SaveChanges();
            }
        }
        
    }
}
