using EldarAliev.BD;
using EldarAliev.Class;
using EldarAliev.WPF.LisView;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
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

namespace EldarAliev.WPF.Authorization
{
    /// <summary>
    /// Логика взаимодействия для Aut.xaml
    /// </summary>
    public partial class Aut : Page
    {
        public Aut()
        {
            InitializeComponent();
        }

        private void input_Click(object sender, RoutedEventArgs e)
        {
            int i = 0;
           
          

                
                    var current = Class1.db.SignIn.FirstOrDefault(item => item.Login == loginTXT.Text && item.Password == passwordTXT.Password);
                    if (current != null)
                    {
                        switch (current.RoleID)
                        {
                            case "A":
                                MessageBoxResult messageBoxResult = MessageBox.Show("Вы вошли! \n Вы уверены, что хотите продолжить?", "Ура!", MessageBoxButton.YesNo, MessageBoxImage.Information);
                                if (messageBoxResult == MessageBoxResult.Yes)
                                {

                            Entrance entrance = new Entrance();
                            entrance.Login = loginTXT.Text;
                            entrance.Date = DateTime.Now;
                            entrance.LoginSuccess = "Успешно!";
                            entrance.Attempts = "1";
                            entrance.SignlnID = current.ID;
                            Class1.db.Entrance.Add(entrance);
                            Class1.db.SaveChanges();

                            Class2.s = current.Role.Status;
                            NavigationService.Navigate(new PageAdm());
                                }
                                break;
                    case "C":
                        MessageBoxResult messageBoxResult2 = MessageBox.Show("Вы вошли! \n Вы уверены, что хотите продолжить?", "Ура!", MessageBoxButton.YesNo, MessageBoxImage.Information);
                        if (messageBoxResult2 == MessageBoxResult.Yes)
                        {

                            Entrance entrance = new Entrance();
                            entrance.Login = loginTXT.Text;
                            entrance.Date = DateTime.Now;
                            entrance.LoginSuccess = "Успешно!";
                            entrance.Attempts = "1";
                            entrance.SignlnID = current.ID;
                            Class1.db.Entrance.Add(entrance);
                            Class1.db.SaveChanges();
                            Class2.s = current.Role.Access;
                            NavigationService.Navigate(new СonsumerWPF());
                        }
                        break;

                    case "S":
                        MessageBoxResult messageBoxResult3 = MessageBox.Show("Вы вошли! \n Вы уверены, что хотите продолжить?", "Ура!", MessageBoxButton.YesNo, MessageBoxImage.Information);
                        if (messageBoxResult3 == MessageBoxResult.Yes)
                        {

                            Entrance entrance = new Entrance();
                            entrance.Login = loginTXT.Text;
                            entrance.Date = DateTime.Now;
                            entrance.LoginSuccess = "Успешно!";
                            entrance.Attempts = "1";
                            entrance.SignlnID = current.ID;
                            Class1.db.Entrance.Add(entrance);
                            Class1.db.SaveChanges();

                            Class2.s = current.Role.Access;
                            NavigationService.Navigate(new СonsumerWPF());
                        }
                        break;


                }
                    }
                
                else
                {
                    //i++;
                  
                    MessageBox.Show("Ошибка! \n Вы уверены, что  все верно?", "ЕМ...." + i, MessageBoxButton.OK, MessageBoxImage.Error);

                Entrance entrance = new Entrance();
                if (loginTXT.Text == "")
                {
                    entrance.Login = "Пусто";
                }
                else
                {
                    entrance.Login = loginTXT.Text;
                }
                entrance.Date = DateTime.Now;
                entrance.LoginSuccess = "Неудачно!";
                entrance.Attempts = "1";
                entrance.SignlnID = 0;
                
                    Class1.db.Entrance.Add(entrance);
                Class1.db.SaveChanges();



            }




        }

        private void output_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Help_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new HelpWPF());
        }
    }
}
