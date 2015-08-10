using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Text;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfConsoleClient
{
    class Program
    {
        private static void Main(string[] args)
        {
            var tcpUri = new Uri("http://localhost:3370/");
            var address = new EndpointAddress(tcpUri);
            var binding = new BasicHttpBinding();
            var factory = new ChannelFactory<IServiceContracts>(binding, address);
            var service = factory.CreateChannel();

            var quite = false;

            while (PrintUserUsage() && !quite)
            {
                try
                {
                    switch (Console.ReadLine().ToUpper())
                    {
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
            Console.WriteLine("Select next for action:\n\t 1 - AddUser \n\t 2 - GetUser \n\t Q - Quit");
            return true;
        }
    }
}
