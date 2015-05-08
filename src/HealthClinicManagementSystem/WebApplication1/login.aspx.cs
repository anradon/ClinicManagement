using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;


namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ViewState["LoginErrors"] = 0;
            }

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (validate(Login1.UserName, Login1.Password))
            {
                //Login1.Visible = false;
                Session["User"] = Login1.UserName;
                FormsAuthenticationTicket tk = new FormsAuthenticationTicket(1, Login1.UserName,DateTime.Now, DateTime.Now.AddHours(2), false, "A");
                string s = FormsAuthentication.Encrypt(tk);
                HttpCookie ck = new HttpCookie(FormsAuthentication.FormsCookieName, s);
                Response.Cookies.Add(ck);
                Response.Redirect("~/Admin/adminhome.aspx");


            }
            else
            {
                e.Authenticated = false;
            
            }
        }

        private bool validate(string username, string password)
        {
            bool signal = false;
            SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select adminname, adminpassword from LoginTable", con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (username == reader["adminname"].ToString() && password == reader["adminpassword"].ToString())
                {
                    signal = true;
                    reader.Close();
                    return signal;
                }
              
            
            }
            return signal;
        
        }
    }
}