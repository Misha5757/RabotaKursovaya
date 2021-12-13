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
    /// Логика взаимодействия для AddOrEditSignlnxaml.xaml
    /// </summary>
    public partial class AddOrEditSignlnxaml : Page
    {
        public SignIn signIn { get; set; }
        public List<Role> roles { get; set; }
        public AddOrEditSignlnxaml(SignIn sign)
        {
            InitializeComponent();
            roles = Class1.db.Role.ToList(); 
            signIn = sign;
            this.DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {


            if (signIn.ID != 0)
            {
                AddorEdit.Content = "Редактирование";
            }
            else if (signIn.ID == 0)
            {
                AddorEdit.Content = "Добавление";
            }

           
        }

        private void AddorEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
            
                var current =  Class1.db.SignIn.FirstOrDefault(item => item.Login == log.Text);

              
                if (signIn.ID == 0)
                {
                    if (current == null)
                    {
                        Class1.db.SignIn.Add(signIn);
                        Class1.db.SaveChanges();
                        MessageBox.Show("Зарегистрирован!");
                    }
                    else
                    {
                        MessageBox.Show("Такой пользователь зарегистрирован!", "УПС!");
                    }
                    }

                else if (signIn.ID != 0)
                {
                    Class1.db.SaveChanges();
                    MessageBox.Show("Успешно!");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Упс!" + ex);
            }
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
