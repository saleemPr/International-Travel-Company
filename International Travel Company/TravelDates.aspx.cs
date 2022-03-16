using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace International_Travel_Company
{
    public partial class Contact : Page
    {
        Travel_DatesEntities db = new Travel_DatesEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Edite_Click(object sender, EventArgs e)
        {
            int s = Convert.ToInt32(HiddenField1.Value);
            var check = db.Travel_tables.SingleOrDefault(i => i.Currency_ISO_Code == Currency_ISO.Text && i.Travel_Id!=s);
            if (check == null)
            {
                exist.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "Popup",
                string.Format("Edite('{0}');", s), true);
            }
            else
            {
                exist.Visible = true;
            }
        }
    }
}