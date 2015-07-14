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
    [ServiceContract]
    public interface IServiceContracts
    {
        [OperationContract]
        string SetUserData(string userName, string firstName, string lastName, DateTime birthDate, string email);

        [OperationContract]
        UserData GetUserData(string userName);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);
    }
}
