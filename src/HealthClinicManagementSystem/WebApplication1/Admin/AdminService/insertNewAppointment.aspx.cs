using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.ServiceReference1;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Admin.AdminService
{
    public partial class insertNewAppointment : System.Web.UI.Page
    {
        WebApplication1.ServiceReference1.Service1Client obj = new WebApplication1.ServiceReference1.Service1Client();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("~/login.aspx");
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
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
                ClinicDetails clinicInfo = new ClinicDetails();
                clinicInfo.UserName = TextBoxUserName.Text;
                clinicInfo.ClinicName = DropDownList1.Text;
                clinicInfo.Date = Calendar1.SelectedDate.Date;
                clinicInfo.Time = TextBoxTime.Text;
                clinicInfo.Status = "Available";
                string result = obj.InsertAvailability(clinicInfo);
                LabelMessage.Text = result;
                LabelMessage.EnableViewState = true;
                LabelMessage.Visible = true;


            
            
            
            }

            if (!authenticate)
            {
                LabelMessage.Text = "You are not authorized!";
                LabelMessage.EnableViewState = true;
                LabelMessage.Visible = true;
            
            }


        }
    }
}