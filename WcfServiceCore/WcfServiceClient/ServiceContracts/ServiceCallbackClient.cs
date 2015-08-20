using System;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfConsoleClient.ServiceContracts
{
    public sealed class ServiceCallbackClient : IServiceContractsCallback
    {
        private static readonly ServiceCallbackClient instance = new ServiceCallbackClient();

        static ServiceCallbackClient()
        {
        }

        private ServiceCallbackClient()
        {
        }

        public static ServiceCallbackClient Instance
        {
            get { return instance; }
        }

        public void OnCallback(string userName, string message)
        {
            Console.WriteLine("Received message from {0}: {1}", userName, message);
        }
    }
}
