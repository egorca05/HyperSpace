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
using HyperSpace.WindowFolder;
using HyperSpace.WindowFolder.AdminFolder;
using HyperSpace.ClassFolder;
using HyperSpace.DataFolder;

namespace HyperSpace.WindowFolder.NoRoleFolder
{
    /// <summary>
    /// Логика взаимодействия для AutorizationWindow.xaml
    /// </summary>
    public partial class AutorizationWindow : Window
    {
        public AutorizationWindow()
        {
            InitializeComponent();
        }

        private void BtmIn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(TbLogin.Text))
            {
                MBClass.MBError("Введите логин");
                TbLogin.Focus();
            }
            if (string.IsNullOrEmpty(PbPassword.Password))
            {
                MBClass.MBError("Введите пароль");
                PbPassword.Focus();
            }
            else
            {
                try
                {
                    var user = DBEntities.GetContext().User.FirstOrDefault
                        (u => u.LoginUser == TbLogin.Text);
                    if(user == null)
                    {
                        MBClass.MBError("Пользователь не найден");
                        TbLogin.Focus();
                        return;
                    }
                    if (user.PasswordUser != PbPassword.Password)
                    {
                        MBClass.MBError("Введен не правильный пароль");
                        PbPassword.Focus();
                        return;
                    }
                    else 
                    {
                        switch(user.IdRole)
                        {
                            case 1:
                                AdminMapWindow adminMapWindow = new AdminMapWindow();
                                adminMapWindow.Show();
                                this.Close();
                                break;
                            case 2:
                                UserFolder.UserGameWindow userFolderWindow =
                                    new UserFolder.UserGameWindow();
                                userFolderWindow.Show();
                                this.Close();
                                break;
                            case 3:
                                DirectorFolder.DirectorMapWindow 
                                    directorMapWindow =
                                    new DirectorFolder.DirectorMapWindow();
                                directorMapWindow.Show();
                                this.Close();
                                break;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MBClass.MBError(ex);
                }
            }         
        }
    }
}
