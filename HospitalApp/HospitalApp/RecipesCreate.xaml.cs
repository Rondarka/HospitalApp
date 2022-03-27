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
using System.Windows.Shapes;

namespace HospitalApp
{
    /// <summary>
    /// Логика взаимодействия для RecipesCreate.xaml
    /// </summary>
    public partial class RecipesCreate : Window
    {
        int ADD;
        int SelectedDoc;
        
        public RecipesCreate()
        {
            InitializeComponent();
            WebClient client = new WebClient();
            client.Encoding = System.Text.Encoding.UTF8;
            var json = client.DownloadString($"http://localhost:61410/api/Doctors/{Models.Terminal.User.Номер_участка}");
            List<Models.Doctor> Doctors = JsonConvert.DeserializeObject<List<Models.Doctor>>(json);
            ComboDoctors.ItemsSource = Doctors;
            ComboDoctors.DisplayMemberPath = "Name";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                while (Convert.ToString(addMin.Content) != IntrevalEnd.Text)
                {
                    if (IntervalStart.Text != Convert.ToString(addMin.Content))
                    {
                        ADD += Convert.ToInt32(timePriem.Text);
                        addMin.Content = Convert.ToDateTime(IntervalStart.Text).AddMinutes(Convert.ToInt32(ADD)).ToShortTimeString();

                        var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:61410/api/Receptions?DoctorId={SelectedDoc}&receptionTime={addMin.Content}&receptrionDate={RecipeDate.Text}");
                        httpWebRequest.ContentType = "application/json";
                        httpWebRequest.Method = "POST";
                        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                        {
                            string recipes = JsonConvert.SerializeObject(new Models.Recipes());

                            streamWriter.Write(recipes);
                            streamWriter.Flush();
                            streamWriter.Close();
                        }
                        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                    }
                    else
                    {                     
                        var httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://localhost:61410/api/Receptions?DoctorId={SelectedDoc}&receptionTime={addMin.Content}&receptrionDate={RecipeDate.Text}");
                        httpWebRequest.ContentType = "application/json";
                        httpWebRequest.Method = "POST";
                        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
                        {
                            string recipes = JsonConvert.SerializeObject(new Models.Recipes());

                            streamWriter.Write(recipes);
                            streamWriter.Flush();
                            streamWriter.Close();
                        }
                        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                        addMin.Content = Convert.ToDateTime(IntervalStart.Text).AddMinutes(Convert.ToInt32(timePriem.Text)).ToShortTimeString();
                    }
                }
                MessageBox.Show("Расписание успешно сформированно");
                this.Hide();
            }
            catch { }         
        }

        private void ComboDoctors_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SelectedDoc = (ComboDoctors.SelectedItem as Models.Doctor).DoctorId;
        }
    }
}
