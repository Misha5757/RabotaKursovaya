using EldarAliev.BD;
using EldarAliev.Class;
using EldarAliev.WPF.ADDandEDIT;
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
    /// Логика взаимодействия для UsersPage.xaml
    /// </summary>
    public partial class UsersPage : Page
    {
        public UsersPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Role1.ItemsSource = Class1.db.SignIn.ToList();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {

            NavigationService.Navigate(new AddOrEditSignlnxaml(new SignIn()));
        }

        private void Del_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                SignIn remove = (SignIn)Role1.SelectedItem;
                if (remove != null)
                {
                    MessageBoxResult messageBoxResult = MessageBox.Show("Вы уверены?", "!!!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                    if (messageBoxResult == MessageBoxResult.Yes)
                    {
                        Class1.db.SignIn.Remove(remove);
                        Class1.db.SaveChanges();
                        Page_Loaded(null, null);
                    }
                }

                else
                {
                    throw new Exception("Длина строки больше 6 символов");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("" + ex);
            }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            if (Role1.SelectedItem != null)
            {
                NavigationService.Navigate(new AddOrEditSignlnxaml(Role1.SelectedItem as SignIn));
            }
            else
            {
                MessageBox.Show("Вы ничего не выбрали!", "УПС!");
            }
           
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();

        }

        private void SearCH_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (SearCH.Text != null)
            {
                Role1.ItemsSource = Class1.db.SignIn.Where(item => item.Login.Contains(SearCH.Text)).ToList();

            }
            else
            {
                Role1.ItemsSource = Class1.db.SignIn.ToList();
            }
        }
    }
}
