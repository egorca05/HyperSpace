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
using WpfGapeev.FolderData;
using WpfGapeev.FolderClass;

namespace WpfGapeev.FolderWindows
{
    /// <summary>
    /// Логика взаимодействия для WindowAutorization.xaml
    /// </summary>
    public partial class WindowAutorization : Window
    {
        public WindowAutorization()
        {
            InitializeComponent();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            ClassMB.ExitMessageBox();
        }

        private void BtnIn_Click(object sender, RoutedEventArgs e)
        {
            if(string.IsNullOrEmpty(TbLogin.Text))
            {
                FolderClass.ClassMB.MBerror("Введите логин");
                TbLogin.Focus();
            }
            else if (string.IsNullOrEmpty(PbPassword.Password))
            {
                FolderClass.ClassMB.MBerror("Введите пароль");
                PbPassword.Focus();
            }
            else
            {
                try
                {
                    var user = DBEntities.GetContext().User.FirstOrDefault(u => u.LoginUser == TbLogin.Text);
                    if(user==null)
                    {
                        FolderClass.ClassMB.MBerror("введен не верный логин");
                        TbLogin.Focus();
                        return;
                    }
                    if(user.PasswordUser!=PbPassword.Password)
                    {
                        FolderClass.ClassMB.MBerror("введен не верный пароль");
                        PbPassword.Focus();
                        return;
                    }
                    else
                    {
                        switch(user.IdRole)
                        {
                            case 1:
                                FolderClass.ClassMB.MBinformation("Администратор");
                                FolderAdmin.WindowMenuAdmin windowMenuAdmin = new FolderAdmin.WindowMenuAdmin();
                                windowMenuAdmin.Show();
                                this.Close();
                                break;
                            case 2:
                                FolderClass.ClassMB.MBinformation("Пользователь");
                                this.Close();
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    FolderClass.ClassMB.MBerror(ex);
                }
            }
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            WindowRegistration windowRegistration = new WindowRegistration();
            windowRegistration.Show();
            this.Close();
        }
    }
}
