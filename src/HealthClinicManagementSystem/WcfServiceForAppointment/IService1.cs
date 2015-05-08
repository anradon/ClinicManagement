using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfServiceForAppointment
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        //[OperationContract]
        //string GetData(int value);

        [OperationContract]

        string InsertUserDetails(UserDetails userInfo);
        // TODO: Add your service operations here
        [OperationContract]
        string RetrieveUserDetails(UserDetails userInfo);
        [OperationContract]
        string InsertAvailability(ClinicDetails clinicInfo);

    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    [DataContract]
    public class UserDetails
    {
        string name = string.Empty;
        string carecardno = string.Empty;
        string clinicname = string.Empty;
        DateTime date;
        string time = string.Empty;
        string email = string.Empty;

        [DataMember]
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        [DataMember]
        public string CareCardNo
        {
            get { return carecardno; }
            set { carecardno = value; }
        }
        [DataMember]
        public string ClinicName
        {
            get { return clinicname; }
            set { clinicname = value; }
        }
        [DataMember]
        public DateTime Date
        {
            get { return date; }
            set { date = value; }

        }
        [DataMember]
        public string Time
        {
            get { return time; }
            set { time = value; }

        }
        [DataMember]
        public string Email
        {
            get { return email; }
            set { email = value; }

        }

   
    }

    [DataContract]
    public class ClinicDetails
    {

        string username = string.Empty;
        string clinicname = string.Empty;
        DateTime date;
        string time = string.Empty;
        string status = string.Empty;


        [DataMember]
        public string UserName
        {
            get { return username; }
            set { username = value; }
        }


        [DataMember]
        public string ClinicName
        {
            get { return clinicname; }
            set { clinicname = value; }
        }

        [DataMember]
        public DateTime Date
        {
            get { return date; }
            set { date = value; }

        }

        [DataMember]
        public string Time
        {
            get { return time; }
            set { time= value; }

        }

        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }

        }

    }


}
