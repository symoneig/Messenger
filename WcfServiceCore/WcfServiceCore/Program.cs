using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Description;
using System.Web;

namespace WcfServiceCore
{
    public class Program
    {
        public static void Main()
        {
            var baseAddress = new Uri("http://localhost:3370/");

            // Create the ServiceHost.
            using (var host = new ServiceHost(typeof(Service), baseAddress))
            {
                // Enable metadata publishing.
                //var smb = new ServiceMetadataBehavior
                //{
                //    HttpGetEnabled = true,
                //    MetadataExporter = {PolicyVersion = PolicyVersion.Policy15}
                //};
                
                //host.Description.Behaviors.Add(smb);

                host.Open();

                Console.WriteLine("The service is ready at {0}", baseAddress);
                Console.WriteLine("Press <Enter> to stop the service.");
                Console.ReadLine();

                host.Close();
            }
        }
    }
}