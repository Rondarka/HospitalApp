using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace HospitalApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegistrMenu.xaml
    /// </summary>
    public partial class RegistrMenu : Page
    {
        Models.UserInfo Users;
        public RegistrMenu()
        {
            InitializeComponent();
            WebClient client = new WebClient();
            client.Encoding = System.Text.Encoding.UTF8;
            try
            {
                var json = client.DownloadString($"http://localhost:61410/api/Workers/{Models.Terminal.User.Код_Сотрудника}");
                Users = JsonConvert.DeserializeObject<Models.UserInfo>(json);
                SotrName.Content = Users.ФИО + " | " + Users.Должность + " ";
            }
            catch
            {
                
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Models.Terminal.frame.Navigate(new Patients());
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Models.Terminal.frame.Navigate(new AdmissionSchedule());
        }
    }
}
