using System.ServiceModel;

namespace WcfServiceCore.DataContracts.ServiceContracts
{
    public interface IServiceContractsCallback
    {
        [OperationContract]
        void OnCallback(string receiverUserName, string message);
    }
}
