using System;
using System.Runtime.Serialization;

namespace WcfServiceCore.DataContracts.DataContracts
{
    [DataContract]
    public class UserData
    {
        [DataMember]
        public string UserName { get; set; }

        [DataMember]
        public string FirstName { get; set; }

        [DataMember]
        public string LastName { get; set; }

        [DataMember]
        public DateTime BirthDate { get; set; }

        [DataMember]
        public string Email { get; set; }
    }
}