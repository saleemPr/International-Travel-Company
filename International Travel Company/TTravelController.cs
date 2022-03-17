using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace International_Travel_Company
{
    public class TTravelController : ApiController
    {
        Travel_DatesEntities db = new Travel_DatesEntities();
        // GET api/<controller>
        public IEnumerable<Travel_table> Get()
        {
            return db.Travel_tables.ToList();
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post(Travel_table travel)
        {
             db.Travel_tables.Add(travel);
             db.SaveChanges();
        }
        public void Post(int id)
        {
            var status = db.Travel_tables.SingleOrDefault(i=>i.Travel_Id == id);
            status.Status = "Canceled";
            db.SaveChanges();
        }

        // PUT api/<controller>/5
        public void Put(Travel_table travel)
        {
            var Change = db.Travel_tables.SingleOrDefault(id=>id.Travel_Id==travel.Travel_Id);
            Change.Currency_ISO_Code = travel.Currency_ISO_Code;
            Change.Travel_timestamp = travel.Travel_timestamp;
            Change.Travel_Price_Amount_in_payment_currency = travel.Travel_Price_Amount_in_payment_currency;

            db.SaveChanges();
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}