using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_EnglishBattle
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Submit_OnClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }
    }
}