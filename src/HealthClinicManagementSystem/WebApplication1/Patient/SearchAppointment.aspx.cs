using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
//using WebApplication1.ServiceReference1;

namespace WebApplication1.Patient
{
    public partial class SearchAppointment : System.Web.UI.Page
    {
       // WebApplication1.ServiceReference1.Service1Client obj2 = new WebApplication1.ServiceReference1.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Calendar1.SelectedDate.Date.ToString("MM/dd/yyyy") == "01/01/0001")
            {

                //Response.Write("Must selest a date");
                LabelMessage2.Text = "Must Select a Date!";
                LabelMessage2.EnableViewState = true;
                LabelMessage2.Visible = true;
            }

            else
            {
                DateTime markedDate = Calendar1.SelectedDate.Date;
                string markedDateString = markedDate.ToString("MM/dd/yyyy");
                if (validate(markedDateString))
                {

                    //Response.Write(markedDateString);
                    SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select clinicname,time from StatusTable where date = @markedDateString and status = 'Available'", con);

                    cmd.Parameters.AddWithValue("@markedDateString", markedDateString);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    DataSet ds = new DataSet();
                    adapter.Fill(ds);
                    this.GridView1.DataSource = ds.Tables[0];
                    this.GridView1.DataBind();
                    this.GridView1.EnableViewState = true;
                    this.GridView1.Visible = true;
                    con.Close();
                }

                else
                {
                    LabelMessage.Text = "There is no available appointment!";
                    LabelMessage.EnableViewState = true;
                    LabelMessage.Visible = true;

                }

            }
        }

        private bool validate(string datestring)
        {
            bool signal = false;
            //string datestring = date.ToString("MM/dd/yyyy");
          // Response.Write(datestring);
           // Console.WriteLine(datestring);
            SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from StatusTable where status = 'Available'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                DateTime dt = new DateTime();
                dt= (DateTime) reader["date"];
                //Response.Write(dt.Date.ToString("MM/dd/yyyy"));
                string key = dt.Date.ToString("MM/dd/yyyy");
               // Response.Write(reader["date"].ToString());
                if (datestring == key)
                {
                    //Response.Write("yes");
                    signal = true;
                    reader.Close();
                    return signal;
                }
               // Response.Write("no");

            }
            return signal;

        }
    }
}