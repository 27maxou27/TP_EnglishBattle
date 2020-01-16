using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    public class VilleService
    {
        private EnglishBattle2Entities _context;

        public VilleService()
        {
            _context = new EnglishBattle2Entities();
        }

        public List<Ville> GetList()
        {
            using (_context)
            {
                var villes = _context.Ville.OrderBy(x => x.nom).ToList();

                return (villes);
            }
        }
    }
}
