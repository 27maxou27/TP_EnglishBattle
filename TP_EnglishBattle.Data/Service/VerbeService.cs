using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    class VerbeService
    {
        private readonly EnglishBattle2Entities _context;

        public VerbeService()
        {
            _context = new EnglishBattle2Entities();
        }

        public List<Verbe> GetList()

        {
            using (_context)
            {
                return _context.Verbe.ToList();
            }

        }
    }
}
