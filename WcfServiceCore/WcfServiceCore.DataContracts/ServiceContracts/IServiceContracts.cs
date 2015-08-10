using System;
using System.ServiceModel;
using WcfServiceCore.DataContracts.DataContracts;

namespace WcfServiceCore.DataContracts.ServiceContracts
{
    [ServiceContract]
    public interface IServiceContracts
    {
        [OperationContract]
        string SetUserData(string userName, string firstName, string lastName, DateTime birthDate, string email);

        [OperationContract]
        UserData GetUserData(string userName);
    }
}
