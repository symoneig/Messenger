using System;
using System.Runtime.Serialization;

namespace WcfServiceCore.DataContracts
{
    [DataContract]
    public class UserData
    {
        private readonly string _userName;
        private readonly string _firstName;
        private readonly string _lastName;
        private readonly DateTime _birthDate;
        private readonly string _email;

        public UserData(string userName, string firstName, string lastName, DateTime birthDate, string email)
        {
            _userName = userName;
            _firstName = firstName;
            _lastName = lastName;
            _birthDate = birthDate;
            _email = email;
        }
        
        [DataMember]
        public string UserName
        {
            get { return _userName; }
        }

        [DataMember]
        public string FirstName
        {
            get { return _firstName; }
        }

        [DataMember]
        public string LastName
        {
            get { return _lastName; }
        }

        [DataMember]
        public DateTime BirthDate
        {
            get { return _birthDate; }
        }

        [DataMember]
        public string Email
        {
            get { return _email; }
        }
    }
}