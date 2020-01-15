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
        private EnglishBattle2Entities _context;

        public JoueurService()
        {
            _context = new EnglishBattle2Entities();
        }

        public Joueur GetItem(int id)
        {
            using (_context)
            {
                var joueur = _context.Joueur.Find(id);

                return joueur;
            }
        }

        public Joueur GetItem(string email, string mdp)
        {
            using (_context)
            {
                var joueur = _context.Joueur.FirstOrDefault(x => x.email == email && x.motDePasse == mdp);

                return (joueur);
            }
        }

        public void Insert(Joueur joueur)
        {
            using (_context)
            {
                _context.Joueur.Add(joueur);
                _context.SaveChanges();
            }
        }

        public List<Joueur> GetList()
        {
            using (_context)
            {
                var list = _context.Joueur.ToList();

                return (list);
            }
        }

        public void Update(Joueur joueur)
        {
            using (_context)
            {
                _context.Entry(joueur).State = EntityState.Modified;
                _context.SaveChanges();
            }
        }

        public void Delete(Joueur joueur)
        {
            using (_context)
            {
                _context.Joueur.Attach(joueur);

                var parties = joueur.Partie;

                foreach (var partie in parties)
                {
                    var questions = partie.Question;

                    _context.Question.RemoveRange(questions);
                }

                _context.Partie.RemoveRange(parties);
                _context.SaveChanges();
            }
        }
        
    }
}
