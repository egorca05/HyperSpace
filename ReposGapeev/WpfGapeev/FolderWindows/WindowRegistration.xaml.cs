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
using System.Windows.Shapes;
using WpfGapeev.FolderClass;
using WpfGapeev.FolderData;

namespace WpfGapeev.FolderWindows
{
    /// <summary>
    /// Логика взаимодействия для WindowRegistration.xaml
    /// </summary>
    public partial class WindowRegistration : Window
    {
        public WindowRegistration()
        {
            InitializeComponent();
        }

        private void BtnIn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(TbLogin.Text))
            {
                ClassMB.MBerror("Вы не ввели логин");
                TbLogin.Focus();
            }
            else if (DBEntities.GetContext().User
                .FirstOrDefault(u => u.LoginUser == TbLogin.Text) != null)
                {
                ClassMB.MBerror("Пользователь с таким логином существует");
                TbLogin.Focus();
            }
            else if (string.IsNullOrEmpty(PbPassword.Password))
            {
                ClassMB.MBerror("Введите пароль");
                PbPassword.Focus();
            }
            else if (string.IsNullOrEmpty(PbPasswordRepiat.Password))
            {
                ClassMB.MBerror("Повторите пароль");
                PbPasswordRepiat.Focus();
            }
            else if (PbPasswordRepiat.Password != PbPassword.Password)
            {
                ClassMB.MBerror("Пароли не совпадают");
                PbPasswordRepiat.Focus();
            }
            else
            {
                try
                {
                    DBEntities.GetContext().User.Add(new User()
                    {
                        LoginUser = TbLogin.Text,
                        PasswordUser = PbPassword.Password,
                        IdRole = 2,
                    });
                    DBEntities.GetContext().SaveChanges();
                    ClassMB.MBinformation("Вы успешно зарегестрировались");
                }
                catch (Exception ex)
                {
                    ClassMB.MBerror(ex);
                }
            }
        }
    }
}
