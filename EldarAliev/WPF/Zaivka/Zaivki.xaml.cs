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

namespace EldarAliev.WPF.Zaivka
{
    /// <summary>
    /// Логика взаимодействия для Zaivki.xaml
    /// </summary>
    public partial class Zaivki : Page
    {
    
        CONSUMER oNSUMER { get; set; }
        public Zaivki(CONSUMER con)
        {
            InitializeComponent();
            oNSUMER = con;
            this.DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
           var sa = oNSUMER.Code;
            RequstOutput.ItemsSource = Class1.db.REQUEST.Where(item => item.ConsumerCode == sa).ToList();
         
        }

      

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

      

        private void DatePi_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            var sa = oNSUMER.Code;
            if (RequstOutput.ItemsSource != null)
            {
                RequstOutput.ItemsSource = Class1.db.REQUEST.Where(Item => Item.DateRequest == DatePi.SelectedDate && Item.ConsumerCode == sa).ToList();
            }
            else
            {
                RequstOutput.ItemsSource = Class1.db.REQUEST.Where(item => item.ConsumerCode == sa).ToList(); 
            }
            }

        private void cleanBtn_Click(object sender, RoutedEventArgs e)
        {
            DatePi.SelectedDate = null;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                this.IsEnabled = false;
                PrintDialog printDialog = new PrintDialog();
                if (printDialog.ShowDialog() == true)
                {
                    printDialog.PrintVisual(RequstOutput, "invoice");
                }
            }
            finally
            {
                this.IsEnabled = true;
            }
        }
    }
}
