using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
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
    /// Логика взаимодействия для HelpWPF.xaml
    /// </summary>
    public partial class HelpWPF : Page
    {
        public HelpWPF()
        {
            InitializeComponent();
           



        }


        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Email.Text != null && LoginNew.Text != null && PasswordNew.Text != null)
                {
                    MailAddress from = new MailAddress("ra107696@gmail.com", "Курсовая РАБОТА");
                    // кому отправляем
                    MailAddress to = new MailAddress("ra107696@gmail.com");
                    // создаем объект сообщения
                    MailMessage m = new MailMessage(from, to);
                    // тема письма
                    m.Subject = "Запрос на регистрацию";
                    // текст письма
                    m.Body = " Login:  " + LoginNew.Text + "<div> </div>" + "Password: " + PasswordNew.Text + "<div> </div>" + " Email: " + Email.Text;
                    // письмо представляет код html
                    m.IsBodyHtml = true;
                    // адрес smtp-сервера и порт, с которого будем отправлять письмо
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    // логин и пароль
                    smtp.Credentials = new NetworkCredential("juniorbizness481@gmail.com", "623015Def");
                    smtp.EnableSsl = true;
                    smtp.Send(m);
                    Console.Read();
                    MessageBox.Show("УСПЕХ! \n Ожидайте регистрации !", "РЕГИСТРАЦИЯ");
                    
                   
                }
                
                else
                {
                    MessageBox.Show("Мне кажется, что то пошло не так!" , "УПС!", MessageBoxButton.OK , MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка" + ex);
            }
        }
    }
}
