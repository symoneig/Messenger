using System;
using System.Collections.Generic;
using WcfServiceCore.DataContracts.DataContracts;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfServiceCore
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ServiceContracts" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ServiceContracts.svc or ServiceContracts.svc.cs at the Solution Explorer and start debugging.
    public class Service : IServiceContracts
    {
        private static readonly Dictionary<string, UserData> UserDataList = new Dictionary<string, UserData>();

        public string SetUserData(string userName, string firstName, string lastName, DateTime birthDate, string email)
        {
            if (UserDataList.ContainsKey(userName)) return "Unable to add user: " + userName;
            UserDataList.Add(userName, new UserData()
            {
                UserName = userName,
                FirstName = firstName,
                LastName = lastName,
                BirthDate = birthDate,
                Email = email
            });
            return "Successfully added user: " + userName;
        }

        public UserData GetUserData(string userName)
        {
            return !string.IsNullOrEmpty(userName) && UserDataList.ContainsKey(userName) ? UserDataList[userName] : null;
        }
    }
}
