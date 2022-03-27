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
        /// Логика взаимодействия для AdmissionSchedule.xaml
        /// </summary>
        public partial class AdmissionSchedule : Page
        {
            List<ListView> lists = new List<ListView>();
            int DoctorId;
            public AdmissionSchedule()
            {
                InitializeComponent();

                //Заполнение текстовых элементов днями недели
                FirstDayLabel.Content = DateTime.Now.ToLongDateString(); 
                SecondDayLabel.Content = DateTime.Now.AddDays(1).ToLongDateString();
                ThirdDayLabel.Content = DateTime.Now.AddDays(2).ToLongDateString();
                FourthDayLabel.Content = DateTime.Now.AddDays(3).ToLongDateString();
                FithDayLabel.Content = DateTime.Now.AddDays(4).ToLongDateString();
                SixthDayLabel.Content = DateTime.Now.AddDays(5).ToLongDateString();
                SeventhinDayLabel.Content = DateTime.Now.AddDays(6).ToLongDateString();
                                                                                                            
                //Вывод в таблицу список докторов
                WebClient client = new WebClient();
                client.Encoding = System.Text.Encoding.UTF8;
                var json = client.DownloadString($"http://localhost:61410/api/Doctors/{Models.Terminal.User.Номер_участка}");
                List<Models.Doctor> Doctors = JsonConvert.DeserializeObject<List<Models.Doctor>>(json);
                DoctorsView.ItemsSource = Doctors;
            }

            private void AdmissView_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {

            }

            private void ListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {

            }

            private void DoctorsView_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {
                if (DoctorsView.SelectedItem != null)
                {
                    lists = new List<ListView>() { FirstDayView, SecondDayView, ThirdDayView, FourthDayView, FithDayView, SixthDayView, SeventhDayView };
                    DoctorId = (DoctorsView.SelectedItem as Models.Doctor).DoctorId;
                    WebClient client = new WebClient();
                    client.Encoding = System.Text.Encoding.UTF8;
                    for (int i = 0; i < lists.Count; i++)
                    {
                        string ActDay = DateTime.Now.AddDays(i).ToString("MM-dd-yyyy");
                        var json = client.DownloadString($"http://localhost:61410/api/Receptions?DoctorId={DoctorId}&ReceptionDate={ActDay}");
                        List<Models.Recipes> recipes = JsonConvert.DeserializeObject<List<Models.Recipes>>(json);
                        lists[i].ItemsSource = recipes;
                    }
                }


            }

            private void ListView_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
            {
                if (FourthDayView.SelectedItem != null)
                {
                    if ((FourthDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                    newForm.Recipeinfo.Content = "Записать на " + (FourthDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                    newForm.ReceprionId = (FourthDayView.SelectedItem as Models.Recipes).ReceptionId;
                    newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void ListView_SelectionChanged_2(object sender, SelectionChangedEventArgs e)
            {
                if (FithDayView.SelectedItem != null)
                {
                    if ((FithDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                    newForm.Recipeinfo.Content = "Записать на " + (FithDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                    newForm.ReceprionId = (FithDayView.SelectedItem as Models.Recipes).ReceptionId;
                    newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void ListView_SelectionChanged_3(object sender, SelectionChangedEventArgs e)
            {

            }

            private void SecondDay_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {
                if (SecondDayView.SelectedItem != null)
                {
                    if ((SecondDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                    newForm.Recipeinfo.Content = "Записать на " + (SecondDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                    newForm.ReceprionId = (SecondDayView.SelectedItem as Models.Recipes).ReceptionId;
                    newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void ListView_SelectionChanged_4(object sender, SelectionChangedEventArgs e)
            {
                if (ThirdDayView.SelectedItem != null)
                {
                    if ((ThirdDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                        newForm.Recipeinfo.Content = "Записать на " + (ThirdDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                        newForm.ReceprionId = (ThirdDayView.SelectedItem as Models.Recipes).ReceptionId;
                        newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void ListView_SelectionChanged_5(object sender, SelectionChangedEventArgs e)
            {
                if (SeventhDayView.SelectedItem != null)
                {
                    if ((SeventhDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                    newForm.Recipeinfo.Content = "Записать на " + (SeventhDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                    newForm.ReceprionId = (SeventhDayView.SelectedItem as Models.Recipes).ReceptionId;
                    newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void FirstDayView_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {

                if (FirstDayView.SelectedItem != null)
                {
                    if ((FirstDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                        newForm.Recipeinfo.Content = "Записать на " + (FirstDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                        newForm.ReceprionId = (FirstDayView.SelectedItem as Models.Recipes).ReceptionId;
                        newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void SixthDayView_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {
                if (SixthDayView.SelectedItem != null)
                {
                    if ((SixthDayView.SelectedItem as Models.Recipes).IsActive == 1)
                    {
                        PatientRecipe newForm = new PatientRecipe();
                         newForm.Recipeinfo.Content = "Записать на " + (SixthDayView.SelectedItem as Models.Recipes).ReceptionTime + " ?";
                         newForm.ReceprionId = (SixthDayView.SelectedItem as Models.Recipes).ReceptionId;
                         newForm.Show();
                    }
                    else
                    {
                        MessageBox.Show("Запись занята");
                    }
                }
            }

            private void Button_Click(object sender, RoutedEventArgs e)
            {
           
            }

            private void Button_Click_1(object sender, RoutedEventArgs e)
            {
                RecipesCreate newForm = new RecipesCreate();
                newForm.Show();
            }
        }
    }
