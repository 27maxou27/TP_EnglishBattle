using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    class QuestionService
    {
        private readonly EnglishBattle2Entities _context;

        public QuestionService()
        {
            _context = new EnglishBattle2Entities();
        }

        public void Insert(List<Verbe> verbes)
        {
            using (_context)
            {
                foreach (Verbe element in verbes)
                {
                    _context.Verbe.Add(element);
                    _context.SaveChanges();
                }
                
            }
        }


    }
}
