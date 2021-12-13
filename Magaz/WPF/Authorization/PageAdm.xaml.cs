using EldarAliev.WPF.ADDandEDIT;
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
    /// Логика взаимодействия для PageAdm.xaml
    /// </summary>
    public partial class PageAdm : Page
    {
        public PageAdm()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new PageHistory());
        }

        private void Nazv_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new UsersPage());
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ConsumerWpfNavigation_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new СonsumerWPF());
        }
    }
}
