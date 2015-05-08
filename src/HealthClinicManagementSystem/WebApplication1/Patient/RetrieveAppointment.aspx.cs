using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using WebApplication1.ServiceReference1;

namespace WebApplication1.Patient
{
    public partial class RetrieveAppointment : System.Web.UI.Page
    {
        WebApplication1.ServiceReference1.Service1Client obj2 = new WebApplication1.ServiceReference1.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UserDetails userInfo = new UserDetails();
            userInfo.Name = TextBoxUserName2.Text;
            userInfo.CareCardNo = TextBoxCareCard2.Text;
            string result = null;
            result = obj2.RetrieveUserDetails(userInfo);
            //Console.WriteLine(result);
            if (result == null)
            {
                LabelMessage1.Text = "You don't have any appointment!";
                LabelMessage1.EnableViewState = true;
                LabelMessage1.Visible = true;

            }

            else
            {
                SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
                con.Open();
                SqlCommand cmd = new SqlCommand("select AppointmentTable.ClinicName,AppointmentTable.Time from AppointmentTable where AppointmentTable.Name = @userName and AppointmentTable.CareCardNo = @userCareCardNo", con);
                cmd.Parameters.AddWithValue("@userName", userInfo.Name);
                cmd.Parameters.AddWithValue("@userCareCardNo", userInfo.CareCardNo);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                adapter.Fill(ds);
                this.GridView1.DataSource = ds.Tables[0];
                this.GridView1.DataBind();
                this.GridView1.EnableViewState = true;
                this.GridView1.Visible = true;
                con.Close();


                LabelMessage2.Text = "Details of your Appointment on "+ result+" are as follows";
                LabelMessage2.EnableViewState = true;
                LabelMessage2.Visible = true;
            
            }
            
        }
    }
}