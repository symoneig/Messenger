using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WcfServiceCore.DataContracts.DataContracts;

namespace WcfConsoleClient
{
    public class ClientActions
    {
        public void SignInUser(string userName, string password)
        {
            if (Program.Service.TrySignIn(userName, password))
            {
                Console.WriteLine("Successfully logged in under: {0}", userName);
            }
            else
            {
                Console.WriteLine("Unable to log in.User name or password incorrect...");
            }
        }

        public void RegisterUser()
        {
            var data = new UserData();

            Console.WriteLine("Please enter new user details...");

            data.UserName = GetUserInput("User Name: ");
            data.UserName = GetUserInput("First Name: ");
            data.UserName = GetUserInput("Last Name: ");
            data.UserName = GetUserInput("Birth Date: ");
            data.UserName = GetUserInput("Email: ");


            if (Program.Service.UserExists(userName))
            {
                Console.WriteLine("User");
            }
        }

        private static string GetUserInput(string message, bool validate = false)
        {
            Console.WriteLine(message);
            var input = Console.ReadLine();

            while (string.IsNullOrEmpty(input) || string.IsNullOrWhiteSpace(input))
            {
                input = Console.ReadLine();

                if (!validate) continue;
                if (!Program.Service.ValidateAddress(input))
                {
                    continue;
                }
            }
            
            return input;
        }
    }
}
