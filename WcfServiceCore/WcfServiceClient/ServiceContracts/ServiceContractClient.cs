using System.ServiceModel;
using System.ServiceModel.Channels;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfConsoleClient.ServiceContracts
{
    public class ServiceContractClient : DuplexClientBase<IServiceContracts>
    {
        private static readonly ServiceContractClient instance = new ServiceContractClient();

        static ServiceContractClient()
        {
        }

        public ServiceContractClient()
            : base(ServiceCallbackClient.Instance)
        {
        }

        public static ServiceContractClient Instance
        {
            get { return instance; }
        }
    }
}