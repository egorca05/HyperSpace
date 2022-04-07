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
using HyperSpace.ClassFolder;
using HyperSpace.WindowFolder.AdminFolder;
using HyperSpace.DataFolder;

namespace HyperSpace.WindowFolder.AdminFolder
{
    /// <summary>
    /// Логика взаимодействия для AdminPayWindow.xaml
    /// </summary>
    public partial class AdminPayWindow : Window
    {
        public AdminPayWindow()
        {
            InitializeComponent();
            LoginDG.ItemsSource = DBEntities.GetContext().User.ToList().
                OrderBy(c => c.LoginUser);
        }      

        private void PayCardBtn_Click(object sender, RoutedEventArgs e)
        {
            User user = LoginDG.SelectedItem as User;
            user.Balans += Convert.ToDecimal(MoneyTB.Text);
            DBEntities.GetContext().SaveChanges();
            MBClass.MBInformation("Успешно пополнено");
        }

        private void BtnMap_Click(object sender, RoutedEventArgs e)
        {
            AdminMapWindow adminMapWindow = new AdminMapWindow();
            adminMapWindow.Show();
            this.Close();
        }

        private void BtnUser_Click(object sender, RoutedEventArgs e)
        {
            AdminUserListWindow adminUserListWindow = new AdminUserListWindow();
            adminUserListWindow.Show();
            this.Close();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            MBClass.ExitMessageBox();
        }

        private void LoginDG_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            
            User user=LoginDG.SelectedItem as User;
            LoginTB.Text = Convert.ToString(user.LoginUser);
        }

        private void LoginTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                LoginDG.ItemsSource = DBEntities.GetContext().User.Where(u => u.LoginUser.StartsWith(LoginTB.Text)).ToList();
                if(LoginDG.Items.Count <= 0)
                {
                    MBClass.MBError("пользователь не найден");
                }
            }
            catch (Exception ex)
            {
                MBClass.MBError("ex");
            }
        }
    }
}
