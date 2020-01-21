using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    class PartieService
    {
        private readonly EnglishBattle2Entities _context;

        public PartieService()
        {
            _context = new EnglishBattle2Entities();
        }

        public void Insert(Partie partie)
        {
            using (_context)
            {
                _context.Partie.Add(partie);
                _context.SaveChanges();
            }
        }
    }
}
