using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using WcfServiceCore.DataContracts;

namespace WcfServiceCore
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ServiceContracts" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ServiceContracts.svc or ServiceContracts.svc.cs at the Solution Explorer and start debugging.
    public class ServiceContracts : IServiceContracts
    {
        private static readonly Dictionary<string, UserData> UserDataList = new Dictionary<string, UserData>();
        public string SetUserData(string userName, string firstName, string lastName, DateTime birthDate, string email)
        {
            if (!UserDataList.ContainsKey(userName))
            {
                UserDataList.Add(userName, new UserData(userName, firstName, lastName, birthDate, email));
                return "Successfully added user: " + userName;
            }
            else
            {
                return "Unable to add user: " + userName;
            }
        }

        public UserData GetUserData(string userName)
        {
            if (!string.IsNullOrEmpty(userName) && UserDataList.ContainsKey(userName))
            {
                return UserDataList[userName];
            }

            return null;
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
        }
    }
}
