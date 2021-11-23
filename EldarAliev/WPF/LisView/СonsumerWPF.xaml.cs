using EldarAliev.BD;
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

namespace EldarAliev.WPF.LisView
{
    /// <summary>
    /// Логика взаимодействия для СonsumerWPF.xaml
    /// </summary>
    public partial class СonsumerWPF : Page
    {
        public СonsumerWPF()
        {
            InitializeComponent();

            
        }

        private void Del_Click(object sender, RoutedEventArgs e)
        {
          CONSUMER remove = (CONSUMER)ConsumerOutput.SelectedItem;
            if (remove != null)
            {
                MessageBoxResult messageBoxResult = MessageBox.Show("Вы уверены?", "!!!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    Class1.db.CONSUMER.Remove(remove);
                    Class1.db.SaveChanges();
                    Page_Loaded(null, null);
                }
            }
            else
            {
                MessageBox.Show("Вы ничего не выбрали!", "УПС!");
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            ConsumerOutput.ItemsSource = Class1.db.CONSUMER.ToList();
        }
    }
}
