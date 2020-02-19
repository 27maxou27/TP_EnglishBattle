using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    public class QuestionService
    {
        private readonly VerbeService _verbeService;

        public QuestionService()
        {
            _verbeService = new VerbeService();
        }

        public void Insert(Question question)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                ctx.Question.Add(question);

                ctx.SaveChanges();
            }
        }

        public List<Question> GetReponsesDePartie(int idPartie)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                var result = ctx.Question.Where(q => q.idPartie == idPartie).ToList();

                return (result);
            }
        }
    }
}
