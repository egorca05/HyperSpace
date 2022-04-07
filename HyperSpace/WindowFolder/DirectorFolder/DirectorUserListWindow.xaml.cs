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
using HyperSpace.WindowFolder.DirectorFolder;
using HyperSpace.ClassFolder;
using HyperSpace.DataFolder;

namespace HyperSpace.WindowFolder.DirectorFolder
{
    /// <summary>
    /// Логика взаимодействия для DirectorUserListWindow.xaml
    /// </summary>
    public partial class DirectorUserListWindow : Window
    {
        public DirectorUserListWindow()
        {
            InitializeComponent();
            UserDG.ItemsSource = DBEntities.GetContext().User.ToList().
                OrderBy(c => c.LoginUser);
        }

        private void BtnMap_Click(object sender, RoutedEventArgs e)
        {
            DirectorMapWindow directorMapWindow = new DirectorMapWindow();
            directorMapWindow.Show();
            this.Close();
        }

        private void BtnReport_Click(object sender, RoutedEventArgs e)
        {
            DirectorReportWindow directorReportWindow = new DirectorReportWindow(); 
            directorReportWindow.Show();
            this.Close();
        }

        private void RegistrationBtn_Click(object sender, RoutedEventArgs e)
        {
            DirectorRegistrationWindow directorRegistrationWindow = new DirectorRegistrationWindow();
            directorRegistrationWindow.ShowDialog();
            UserDG.ItemsSource = DBEntities.GetContext().User.ToList().
               OrderBy(c => c.LoginUser);

        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            MBClass.ExitMessageBox();

        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                UserDG.ItemsSource = DBEntities.GetContext().User.Where
                    (u => u.LoginUser.StartsWith(SearchTB.Text)).ToList();

                if (UserDG.Items.Count <= 0)
                {
                    MBClass.MBError("Пользователь не найден");
                }
            }
            catch (Exception ex)
            {
                MBClass.MBError(ex);
            }
        }
    }
}
