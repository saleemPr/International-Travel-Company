using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace International_Travel_Company
{
    public partial class Add : System.Web.UI.Page
    {
        Travel_DatesEntities db = new Travel_DatesEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Add_Click(object sender, EventArgs e)
        {
            Travel_table travel_Table = new Travel_table();
            decimal Tprice = Convert.ToDecimal(prices.Text);
            DateTime dateTime = Convert.ToDateTime(Travel_time.Text);
            travel_Table.Currency_ISO_Code = Currency_ISO.Text;
            travel_Table.Travel_Price_Amount_in_payment_currency = Tprice;
            travel_Table.Travel_timestamp = dateTime;
            db.Travel_tables.Add(travel_Table);
            db.SaveChanges();
        }

    }
}