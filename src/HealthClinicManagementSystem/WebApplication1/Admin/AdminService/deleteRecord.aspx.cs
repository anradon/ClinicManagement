using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Admin.AdminService
{
    public partial class deleteRecord : System.Web.UI.Page
    {
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

            bool authenticate = false;
            SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select adminclinic from LoginTable where adminname = @username", con);
            cmd.Parameters.AddWithValue("@username", TextBoxUserName.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader["adminclinic"].ToString() == DropDownList1.Text)
                {
                    authenticate = true;
                    con.Close();
                    break;
                }

                else
                {
                    LabelMessage.Text = "You are not authorized!";
                    LabelMessage.EnableViewState = true;
                    LabelMessage.Visible = true;


                }

            }

            if (authenticate)
            {
                DateTime markedDate = Calendar1.SelectedDate.Date;
                string markedDateString = markedDate.ToString("MM/dd/yyyy");
                SqlConnection con2 = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
                con2.Open();
                SqlCommand cmd2 = new SqlCommand("Delete from AppointmentTable where Date = @markedDateString and ClinicName = @givenclinic",con2);
                SqlCommand cmd3 = new SqlCommand("Delete from StatusTable where date = @markedDateString and clinicname = @givenclinic", con2);
                cmd2.Parameters.AddWithValue("@markedDateString", markedDateString);
                cmd3.Parameters.AddWithValue("@markedDateString", markedDateString);
                cmd2.Parameters.AddWithValue("@givenclinic", DropDownList1.Text);
                cmd3.Parameters.AddWithValue("@givenclinic", DropDownList1.Text);
                int app = cmd2.ExecuteNonQuery();
                int st = cmd3.ExecuteNonQuery();
                con2.Close();
                if (app > 0 && st > 0)
                {
                    LabelMessage.Text = "Records have been deleted!";
                    LabelMessage.EnableViewState = true;
                    LabelMessage.Visible = true;

                }

                else
                {

                    LabelMessage.Text = "Problem occured during deletion!";
                    LabelMessage.EnableViewState = true;
                    LabelMessage.Visible = true;

                
                
                }
            
            }

        }
    }
}