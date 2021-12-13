using EldarAliev.BD;
using EldarAliev.Class;
using EldarAliev.WPF.ADDandEDIT;
using EldarAliev.WPF.Zaivka;
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
            try
            {
                CONSUMER remove = (CONSUMER)ConsumerOutput1.SelectedItem;
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
                    throw new Exception("Длина строки больше 6 символов");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("" + ex);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            
           

            ConsumerOutput1.ItemsSource = Class1.db.CONSUMER.ToList();
            
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            if (Class2.s == "U")
            {

                MessageBox.Show("Недостаточно прав!", "Упс!", MessageBoxButton.OK , MessageBoxImage.Error);
            }
            if (Class2.s == "A" || Class2.s == "S")
            {
                if (ConsumerOutput1.SelectedItem != null)
                {
                    NavigationService.Navigate(new AddEdit(ConsumerOutput1.SelectedItem as CONSUMER));
                }
                else
                {
                    MessageBox.Show("Вы ничего не выбрали!", "УПС!");
                }
            }


        }


           

        private void SearCH_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (SearCH.Text != "")
            {

                ConsumerOutput1.ItemsSource = Class1.db.CONSUMER.Where(item => item.Title == SearCH.Text || item.Address == SearCH.Text || item.Invoice == SearCH.Text || item.INN == SearCH.Text || item.Code.ToString() == SearCH.Text).ToList();
            }
            else
            {
                ConsumerOutput1.ItemsSource = Class1.db.CONSUMER.ToList();
            }
        }

        private void Zaiv_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Вы перейдете на страницу --> Информация о заявках от данного потребителя");

            CONSUMER zaiv = (CONSUMER)ConsumerOutput1.SelectedItem;
            if (zaiv != null)
            {
                NavigationService.Navigate(new Zaivki(ConsumerOutput1.SelectedItem as CONSUMER));
            }
            else
            {
                MessageBox.Show("Вы ничего не выбрали!", "УПС!");
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (Class2.s == "U")
            {

                MessageBox.Show("Недостаточно прав!", "Упс!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            if (Class2.s == "A" || Class2.s == "S")
            {
                if (ConsumerOutput1.SelectedItem != null)
                {
                    NavigationService.Navigate(new AddEdit(new CONSUMER()));
                }
                else
                {
                    MessageBox.Show("Вы ничего не выбрали!", "УПС!");
                }
            }

          
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
