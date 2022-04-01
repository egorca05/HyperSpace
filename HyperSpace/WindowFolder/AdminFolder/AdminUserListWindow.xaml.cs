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

namespace HyperSpace.WindowFolder.AdminFolder
{
    /// <summary>
    /// Логика взаимодействия для AdminUserListWindow.xaml
    /// </summary>
    public partial class AdminUserListWindow : Window
    {
        public AdminUserListWindow()
        {
            InitializeComponent();
        }

        private void BtnUser_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnMap_Click(object sender, RoutedEventArgs e)
        {
            AdminMapWindow adminMapWindow = new AdminMapWindow();
            adminMapWindow.Show();
            this.Close();
        }

        private void BtnPay_Click(object sender, RoutedEventArgs e)
        {
            AdminPayWindow adminPayWindow = new AdminPayWindow();
            adminPayWindow.Show();
            this.Close();
        }

        private void RegistrationBtn_Click(object sender, RoutedEventArgs e)
        {
            AdminRegistrationWindow adminRegistrationWindow = 
                new AdminRegistrationWindow();
            adminRegistrationWindow.Show();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            MBClass.ExitMessageBox();
        }
    }
}
