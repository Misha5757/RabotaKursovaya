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

namespace EldarAliev.WPF.ADDandEDIT
{
    /// <summary>
    /// Логика взаимодействия для AddEdit.xaml
    /// </summary>
   
    public partial class AddEdit : Page
    {
        
        public CONSUMER consumer { get; set; }
        public List<PROFILE> profile { get; set; }
        public AddEdit(CONSUMER consumers)
        {
            InitializeComponent();
            profile = Class1.db.PROFILE.ToList();
            consumer = consumers;
            this.DataContext = this;

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            if (consumer.Code != 0)
            {
                AddorEdit.Content = "Редактирование";
            }
            else if (consumer.Code == 0)
            {
                AddorEdit.Content = "Добавление";
            }
         
        }

        private void AddorEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (consumer.Code == 0)
                {
                    Class1.db.CONSUMER.Add(consumer);
                }
                Class1.db.SaveChanges();
                MessageBox.Show("Успешно!");
            }
            catch (Exception ex)
            {
                MessageBox.Show( "s" + ex);
            }
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
