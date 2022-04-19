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
    /// Логика взаимодействия для AdminMapWindow.xaml
    /// </summary>
    public partial class AdminMapWindow : Window
    {
        public AdminMapWindow()
        {
            InitializeComponent();
            
        }


        private void BtnPay_Click(object sender, RoutedEventArgs e)
        {
            AdminPayWindow adminPayWindow = new AdminPayWindow();
            adminPayWindow.Show();
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

		private void PC1_Checked(object sender, RoutedEventArgs e)
		{
			Work.work1 = 1;
            if (Work.work1 ==1)
			{
                PC1.BorderBrush = ;
			}
		}
        public class Work
        {
            public static int work1;
        }

		private void BtnPower_Click(object sender, RoutedEventArgs e)
		{
            PC1.IsEnabled=false;
		}
	}
}
