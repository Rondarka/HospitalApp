using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для Patients.xaml
    /// </summary>
    public partial class Patients : Page
    {
        public Patients()
        {
            InitializeComponent();
            WebClient client = new WebClient();
            client.Encoding = System.Text.Encoding.UTF8;
            var json = client.DownloadString($"http://localhost:61410/api/Patients?sitenumber={Models.Terminal.User.Номер_участка}");
            List<Models.Patient> Patients = JsonConvert.DeserializeObject<List<Models.Patient>>(json);
            PatientsGrid.ItemsSource = Patients;
        }

        private void DataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void newPatient_Click(object sender, RoutedEventArgs e)
        {
            if (PatAdres.Text != "" & PatBirth.Text != "" & PatName.Text != "" & PatPhone.Text != "" & PatPolis.Text != "" & PatSnils.Text != "")
            {
                var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:61410/api/Patients?name={PatName.Text}&birth={Convert.ToDateTime(PatBirth.Text).ToShortDateString()}&adres={PatAdres.Text}&phone={PatPhone.Text}&snils={PatSnils.Text}&polis={PatPolis.Text}&sitecode={Models.Terminal.User.Номер_участка}");
                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Method = "POST";
                using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                {
                    string Patient = JsonConvert.SerializeObject(new Models.Patient());

                    streamWriter.Write(Patient);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();

                WebClient client = new WebClient();
                client.Encoding = System.Text.Encoding.UTF8;
                var json = client.DownloadString($"http://localhost:61410/api/Patients?sitenumber={Models.Terminal.User.Номер_участка}");
                List<Models.Patient> Patients = JsonConvert.DeserializeObject<List<Models.Patient>>(json);
                PatientsGrid.ItemsSource = Patients;
            }
            else
            {
                MessageBox.Show("Все поля обязательны для заполнения!");
            }
        }
    }
}
