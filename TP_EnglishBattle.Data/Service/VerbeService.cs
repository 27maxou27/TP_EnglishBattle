using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_EnglishBattle.Data.Service
{
    public class VerbeService
    {
        public VerbeService()
        {

        }

        public bool IsVerbeValid(int id, string preterit, string participePasse)
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                bool result = ctx.Verbe.Where(v => v.id == id && v.preterit == preterit && v.participePasse == participePasse).Any();

                return (result);
            }
        }

        public List<Verbe> GetVerbes() {
            using (var ctx = new EnglishBattle2Entities())
            {
                var list = ctx.Verbe.ToList();

                return (list);
            }
        }

        public List<Verbe> GetListeVerbesAleatoire()
        {
            using (var ctx = new EnglishBattle2Entities())
            {
                var list = ctx.Verbe.Take(60).ToList();

                list = Shuffle(list);

                return (list);
            }
        }

        private List<E> Shuffle<E>(List<E> inputList)
        {
            List<E> randomList = new List<E>();

            Random r = new Random();
            int randIndex;

            while (inputList.Count > 0)
            {
                randIndex = r.Next(0, inputList.Count);
                randomList.Add(inputList[randIndex]);
                inputList.RemoveAt(randIndex);
            }

            return (randomList);
        }
    }
}
