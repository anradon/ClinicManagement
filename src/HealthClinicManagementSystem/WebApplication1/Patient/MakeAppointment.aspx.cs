using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.ServiceReference1;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Patient
{
    
    public partial class MakeAppointment : System.Web.UI.Page
    {
        WebApplication1.ServiceReference1.Service1Client obj = new WebApplication1.ServiceReference1.Service1Client();
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
                SqlConnection con1 = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
                con1.Open();
                SqlCommand cmd1 = new SqlCommand("getInfo",con1);
                cmd1.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd1.ExecuteReader();
                bool signal = false;
                while(reader.Read())
                {
                    if(reader["RegisteredUser"].ToString()==TextBoxUserName.Text)
                    {
                        if (reader["CareCardNo"].ToString() == TextBoxCareCard.Text)
                        {
                            signal = true;
                            reader.Close();
                            break;
                        
                        }
                    
                    }
                
                }
                if (signal)
                {
                    DateTime markedDate = Calendar1.SelectedDate.Date;
                    string markedDateString = markedDate.ToString("MM/dd/yyyy");
                    if (validate(markedDateString))
                    {
                        //Response.Write("yes");
                        UserDetails userInfo = new UserDetails();
                        userInfo.Name = TextBoxUserName.Text;
                        userInfo.ClinicName = DropDownList1.Text;
                        userInfo.CareCardNo = TextBoxCareCard.Text;
                        userInfo.Date = Calendar1.SelectedDate.Date;
                        // Console.WriteLine(userInfo.Date);
                        userInfo.Time = TextBoxTime.Text;
                        userInfo.Email = TextBoxEmail.Text;

                        SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
                        con.Open();
                        SqlCommand cmd = new SqlCommand("update StatusTable set status='Booked' where date = @markedDateString and time = @markedTime and clinicname = @markedClinic", con);

                        cmd.Parameters.AddWithValue("@markedDateString", markedDateString);
                        cmd.Parameters.AddWithValue("@markedTime", userInfo.Time);
                        cmd.Parameters.AddWithValue("@markedClinic", userInfo.ClinicName);
                        int updateresult = 0;
                        updateresult = cmd.ExecuteNonQuery();
                        if (updateresult != 0)
                        {
                            //message = "inserted successfully";
                            //Console.WriteLine(message);
                            string result = obj.InsertUserDetails(userInfo);
                            LabelMessage.Text = result;
                            LabelMessage.EnableViewState = true;
                            LabelMessage.Visible = true;
                        }

                        else
                        {
                            LabelMessage3.Text = "Already Booked by Someone Else!";
                            LabelMessage3.EnableViewState = true;
                            LabelMessage3.Visible = true;

                        }




                    }

                    else
                    {
                        LabelMessage3.Text = "There is no available appointment!";
                        LabelMessage3.EnableViewState = true;
                        LabelMessage3.Visible = true;

                    }
                }


                else
                {


                    LabelMessage.Text = "User Name/CareCard No invalid";
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
            SqlCommand cmd = new SqlCommand("select * from StatusTable where status='Available' and clinicname = @givenclinic", con);
            cmd.Parameters.AddWithValue("@givenclinic", DropDownList1.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            
           // Response.Write(TextBoxTime.Text);
            while (reader.Read())
            {
               // Response.Write(reader["time"].ToString());
                DateTime dt = new DateTime();
                dt = (DateTime)reader["date"];
                //Response.Write(dt.Date.ToString("MM/dd/yyyy"));
                string key = dt.Date.ToString("MM/dd/yyyy");

                if (datestring == key && TextBoxTime.Text == reader["time"].ToString())
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