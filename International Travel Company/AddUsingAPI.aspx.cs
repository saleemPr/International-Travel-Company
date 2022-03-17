using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace International_Travel_Company
{
    public partial class AddUsingAPI : Page
    {
        Travel_DatesEntities db = new Travel_DatesEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Addition_Click(object sender, EventArgs e)
        {
            var check = db.Travel_tables.SingleOrDefault(i=>i.Currency_ISO_Code == Currency_ISO.Text);
            if (check == null)
            {
                Added.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "OnLoad", "Add();", true);
            }
            else
            {
                exist.Visible = true;
            }
        }
    }
}