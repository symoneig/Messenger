using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.Text;
using WcfConsoleClient.ServiceContracts;
using WcfServiceCore.DataContracts.ServiceContracts;

namespace WcfConsoleClient
{
    public class Program
    {
        public static IServiceContracts Service = ServiceContractClient.Instance.ChannelFactory.CreateChannel();

        private static ActionEnum ProcessUserInput(string input)
        {
            int result;

            return int.TryParse(input, out result) ? (ActionEnum)result : ActionEnum.None;
        }

        private static void Main(string[] args)
        {
            var quite = false;
            string currentUser = null;

            while (PrintUserUsage() && !quite)
            {
                try
                {
                    switch (ProcessUserInput(Console.ReadLine()))
                    {
                        case ActionEnum.Register:
                            break;
                        
                        case ActionEnum.SignIn:
                            break;

                        case "0":
                            Console.WriteLine("Enter user name:");
                            var user = Service.GetUserData(Console.ReadLine());
                            Service.TrySignIn(user.UserName);

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

                            Service.SetUserData(userName, firstName, lastName, new DateTime(), email);
                            break;

                        case "2":

                            Console.WriteLine("Enter User Name: ");
                            var result = Service.GetUserData(Console.ReadLine());

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

                            Service.SendMessage(currentUser, sendTo, message);
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
