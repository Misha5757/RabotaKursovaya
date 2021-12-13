using EldarAliev.Class;
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
    /// Логика взаимодействия для PageHistory.xaml
    /// </summary>
    public partial class PageHistory : Page
    {
        public PageHistory()
        {
            InitializeComponent();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            HistoryOutput1.ItemsSource = Class1.db.Entrance.ToList();
        }

        private void SearCH_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (SearCH.Text != null)
            {
                HistoryOutput1.ItemsSource = Class1.db.Entrance.Where(item => item.Login.Contains(SearCH.Text) || item.LoginSuccess.Contains(SearCH.Text)).ToList();

            }
            else
            {
                HistoryOutput1.ItemsSource = Class1.db.SignIn.ToList();
            }

        }
    }
}
