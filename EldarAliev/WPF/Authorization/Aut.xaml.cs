using EldarAliev.Class;
using EldarAliev.WPF.LisView;
using System;
using System.Collections.Generic;
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

            var current = Class1.db.SignIn.FirstOrDefault(item => item.Login == loginTXT.Text && item.Password == passwordTXT.Password);
            if (current != null)
            {
                switch (current.RoleID)
                {
                    case "A":
                      MessageBoxResult messageBoxResult = MessageBox.Show("Вы вошли! \n Вы уверены, что хотите продолжить?", "Ура!", MessageBoxButton.YesNo, MessageBoxImage.Information);
                       if(messageBoxResult == MessageBoxResult.Yes)
                        {
                            NavigationService.Navigate(new СonsumerWPF());
                        }
                        break;


                }
            }
            else
            {
                throw new Exception("Проверьте корректность введенных данных!");
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
