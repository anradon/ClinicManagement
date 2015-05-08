using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace WcfServiceForAppointment
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        /*public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }*/

        public string InsertUserDetails(UserDetails userInfo)
        {

            string message;
            //userInfo.Name = "radon";
            //userInfo.CareCardNo = "123";
            //userInfo.Date = "ddd";
           // userInfo.Email = "aa";


            SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into AppointmentTable(Name,CareCardNo,ClinicName,Date,Time,Email) values(@Name,@CareCardNo,@ClinicName,@Date,@Time,@Email)", con);
            cmd.Parameters.AddWithValue("@Name", userInfo.Name);
            cmd.Parameters.AddWithValue("@CareCardNo", userInfo.CareCardNo);
            cmd.Parameters.AddWithValue("@ClinicName", userInfo.ClinicName);
            cmd.Parameters.AddWithValue("@Date", userInfo.Date);
            cmd.Parameters.AddWithValue("@Time", userInfo.Time);
            cmd.Parameters.AddWithValue("@Email", userInfo.Email);
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                message = userInfo.Name + " inserted successfully";
                //Console.WriteLine(message);
            }

            else
            {
                message = userInfo.Name + "not inserted";
            }
            con.Close();
            return message;

        }


        public string RetrieveUserDetails(UserDetails userInfo)
        {

            string appointmentdate = null;

            SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Date from AppointmentTable where Name = @Name and CareCardNo = @CareCardNo", con);
            cmd.Parameters.AddWithValue("@Name", userInfo.Name);
            cmd.Parameters.AddWithValue("@CareCardNo", userInfo.CareCardNo);
            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                DateTime dt = new DateTime();
                dt = (DateTime)reader["date"];
                appointmentdate = dt.Date.ToString("MM/dd/yyyy");
                //Console.WriteLine(appointmentdate);
                //appointmentdate = "march";
            }
            
            con.Close();
         
            return appointmentdate;

        }


        public string InsertAvailability(ClinicDetails clinicInfo)
        {

            string message;
            //userInfo.Name = "radon";
            //userInfo.CareCardNo = "123";
            //userInfo.Date = "ddd";
            // userInfo.Email = "aa";


            SqlConnection con = new SqlConnection("Data Source=radon;Initial Catalog=Clinic;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into StatusTable(username,clinicname,date,time,status) values(@username,@clinicname,@date,@time,@status)", con);
            cmd.Parameters.AddWithValue("@username", clinicInfo.UserName);
            cmd.Parameters.AddWithValue("@clinicname", clinicInfo.ClinicName);
            cmd.Parameters.AddWithValue("@date", clinicInfo.Date);
            cmd.Parameters.AddWithValue("@time", clinicInfo.Time);
            cmd.Parameters.AddWithValue("@status", clinicInfo.Status);
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                message = "inserted successfully";
                //Console.WriteLine(message);
            }

            else
            {
                message = "not inserted";
            }
            con.Close();
            return message;

        }

    }


}
