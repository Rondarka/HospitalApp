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
using Newtonsoft.Json;

namespace HospitalApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для autorization.xaml
    /// </summary>
    public partial class autorization : Page
    {
        public autorization()
        {
            InitializeComponent();
        }

        private void btnJoin_Click(object sender, RoutedEventArgs e)
        {
            WebClient client = new WebClient();
            client.Encoding = System.Text.Encoding.UTF8;
            try
            {
                var json = client.DownloadString($"http://localhost:61410/api/Workers?login={txtLogin.Text}&password={txtPassword.Text}");
                Models.Terminal.User = JsonConvert.DeserializeObject<Models.UserInfo>(json);
                if (Models.Terminal.User.Должность.ToLower() == "регистратура")
                {
                    Models.Terminal.frame.Navigate(new RegistrMenu());
                }
                else
                {
                    MessageBox.Show("неверные данные");
                }
            }
            catch
            {
                MessageBox.Show("Пользователь не найден");
            }
        }
    }
}
