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
using System.Windows.Shapes;

namespace HospitalApp
{
    /// <summary>
    /// Логика взаимодействия для PatientRecipe.xaml
    /// </summary>
    public partial class PatientRecipe : Window
    {
        public int ReceprionId;
        public int selectedPatientId;
        public PatientRecipe()
        {
            InitializeComponent();
            
            WebClient client = new WebClient();
            client.Encoding = System.Text.Encoding.UTF8;
            var json = client.DownloadString($"http://localhost:61410/api/Patients?sitenumber={Models.Terminal.User.Номер_участка}");
            List<Models.Patient> Patients = JsonConvert.DeserializeObject<List<Models.Patient>>(json);
            cmbPatients.ItemsSource = Patients;
            cmbPatients.DisplayMemberPath = "Name";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:61410/api/Records?ReceptionId={ReceprionId}&CardCode={selectedPatientId}&WorkerCode={Models.Terminal.User.Код_Сотрудника}");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            using (var streamWriter = new System.IO.StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string Records = JsonConvert.SerializeObject(new Models.Records());
                streamWriter.Write(Records);
                streamWriter.Flush();
                streamWriter.Close();
            }
            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            MessageBox.Show("Запись успешно создана");
            this.Hide();
        }

        private void cmbPatients_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedPatientId = (cmbPatients.SelectedItem as Models.Patient).CardCode;
        }
    }
}
