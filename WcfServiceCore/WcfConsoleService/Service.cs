using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Text.RegularExpressions;
using WcfServiceCore.DataContracts.DataContracts;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfConsoleService
{
    public class ServiceMessenger : IServiceContracts
    {
        private static readonly Dictionary<string, UserData> UserDataList = new Dictionary<string, UserData>();

        private static readonly Dictionary<string, IServiceContractsCallback> Callbacks =
            new Dictionary<string, IServiceContractsCallback>();

        public bool UserExists(string userName)
        {
            return UserDataList.ContainsKey(userName);
        }

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

        public void SendMessage(string senderUserName, string receiverUserName, string message)
        {
            if (!Callbacks.ContainsKey(receiverUserName)) return;
            Callbacks[receiverUserName].OnCallback(receiverUserName, message);
        }

        public bool TrySignIn(string userName, string password)
        {
            throw new NotImplementedException();
        }

        public bool ValidateAddress(string emailAddress)
        {
            Console.WriteLine("Validating: {0}", emailAddress);

            const string pattern = @"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$";
            return Regex.IsMatch(emailAddress, pattern);
        }

        public void SignIn(string userName)
        {
            if (!UserDataList.ContainsKey(userName)) return;
            var callback = OperationContext.Current.GetCallbackChannel<IServiceContractsCallback>();
            Callbacks.Add(userName, callback);
        }
    }
}
