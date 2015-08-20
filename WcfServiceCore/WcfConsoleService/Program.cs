using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;

namespace WcfConsoleService
{
    public class Program
    {
        public static void Main(string[] args)
        {
            try
            {
                using (var host = new ServiceHost(typeof(ServiceMessenger)))
                {
                    host.Open();

                    Console.WriteLine("***** The service is ready at {0} *****", host.BaseAddresses.Single());
                    Console.WriteLine("***** Press <Q> to stop the service. *****");
                    
                    while (Console.ReadLine().ToUpper() != "Q")
                    {
                        host.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: ", ex.ToString());
                Console.WriteLine("Press any key to quite...");
                Console.ReadLine();
            }
        }
    }
}
