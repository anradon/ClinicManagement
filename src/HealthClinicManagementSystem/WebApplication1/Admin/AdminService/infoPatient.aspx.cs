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
    public partial class infoPatient : System.Web.UI.Page
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

            else
            {
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
                   // Response.Write("authenticated");
                    DateTime markedDate = Calendar1.SelectedDate.Date;
                    string markedDateString = markedDate.ToString("MM/dd/yyyy");
                    if (validate(markedDateString))
                    {
                        //Response.Write("yes");

                        //Response.Write(markedDateString);
                        SqlConnection con2 = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
                        con.Open();
                        //SqlCommand cmd = new SqlCommand("select clinicname,time from StatusTable where date = @markedDateString and status = 'Available'", con);
                        SqlCommand cmd2 = new SqlCommand("select AppointmentTable.Name, AppointmentTable.CareCardNo,AppointmentTable.Time from AppointmentTable where AppointmentTable.ClinicName = @givenclinic and AppointmentTable.Date = @markedDateString", con2);

                        cmd2.Parameters.AddWithValue("@markedDateString", markedDateString);
                        cmd2.Parameters.AddWithValue("@givenclinic", DropDownList1.Text);
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd2);

                        DataSet ds = new DataSet();
                        adapter.Fill(ds);
                        this.GridView1.DataSource = ds.Tables[0];
                        this.GridView1.DataBind();
                        this.GridView1.EnableViewState = true;
                        this.GridView1.Visible = true;
                        con2.Close();
                    }

                    else
                    {
                        LabelMessage.Text = "There is no patient info found!";
                        LabelMessage.EnableViewState = true;
                        LabelMessage.Visible = true;

                    }
                }

                else
                {
                    LabelMessage.Text = "You are not authorized!";
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
            //SqlCommand cmd = new SqlCommand("select AppointmentTable.Name, AppointmentTable.CareCardNo, StatusTable.clinicname,StatusTable.time from AppointmentTable,StatusTable where StatusTable.status = 'Booked' and StatusTable.date = @givenDate", con);
            SqlCommand cmd = new SqlCommand("select * from StatusTable where status = 'Booked'",con);
            //cmd.Parameters.AddWithValue("@givenDate", datestring);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                DateTime dt = new DateTime();
                dt = (DateTime)reader["date"];
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