using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.Text;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfConsoleClient
{
    public class ServiceContractClient : DuplexClientBase<IServiceContracts>
    {
        public ServiceContractClient(object callbackInstance, Binding binding, EndpointAddress remoteAddress)
            : base(callbackInstance, binding, remoteAddress) { }
    }

    public class ServiceCallbackClient : IServiceContractsCallback
    {
        public void OnCallback(string userName, string message)
        {
            Console.WriteLine("Received message from {0}: {1}", userName, message);
        }
    }

    public class Program
    {
        private static void Main(string[] args)
        {
            var tcpUri = new Uri("http://localhost:3370/Service.svc");
            //var address = new EndpointAddress(tcpUri);
            //var binding = new BasicHttpBinding();
            var binding  = new WSDualHttpBinding();

            var callback = new ServiceCallbackClient();
            var client = new ServiceContractClient(callback, binding, new EndpointAddress(tcpUri));

            //var factory = new ChannelFactory<IServiceContracts>(binding, address);
            var service = client.ChannelFactory.CreateChannel();

            var quite = false;
            string currentUser = null;

            while (PrintUserUsage() && !quite)
            {
                try
                {
                    switch (Console.ReadLine().ToUpper())
                    {
                        case "0":
                            Console.WriteLine("Enter user name:");
                            var user = service.GetUserData(Console.ReadLine());
                            service.GeristerUserCallback(user.UserName);

                            if (user != null)
                            {
                                Console.WriteLine("Current user is {0}", user.UserName);
                            }
                            else
                            {
                                Console.WriteLine("User doesn't exists... Please register first!");
                            }
                            break;

                        case "1":

                            Console.WriteLine("Enter new user details...");

                            Console.Write("User Name :");
                            var userName = Console.ReadLine();

                            Console.Write("First Name :");
                            var firstName = Console.ReadLine();

                            Console.Write("Last Name: ");
                            var lastName = Console.ReadLine();

                            Console.Write("Birth Date: ");
                            var birthDate = Console.ReadLine();

                            Console.Write("Email: ");
                            var email = Console.ReadLine();

                            service.SetUserData(userName, firstName, lastName, new DateTime(), email);
                            break;

                        case "2":

                            Console.WriteLine("Enter User Name: ");
                            var result = service.GetUserData(Console.ReadLine());

                            if (result != null)
                            {
                                Console.WriteLine(result.UserName);
                                Console.WriteLine(result.FirstName);
                                Console.WriteLine(result.LastName);
                                Console.WriteLine(result.BirthDate);
                                Console.WriteLine(result.Email);
                            }
                            else
                            {
                                Console.WriteLine("User not found...");
                            }
                            break;
                        case "3":
                            Console.WriteLine("Enter User Name: ");
                            var sendTo = Console.ReadLine();

                            Console.WriteLine("Enter text message: ");
                            var message = Console.ReadLine();

                            service.SendMessage(currentUser, sendTo, message);
                            break;
                        case "Q":
                            quite = true;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }

        private static bool PrintUserUsage()
        {
            Console.WriteLine("Select next for action:\n\t 0 - SetCurrentUser \n\t 1 - AddUser \n\t 2 - GetUser \n\t 3 - SendMessage \n\t Q - Quit");
            return true;
        }
    }
}
