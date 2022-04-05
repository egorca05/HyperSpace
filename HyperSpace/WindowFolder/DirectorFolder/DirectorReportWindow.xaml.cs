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

namespace HyperSpace.WindowFolder.DirectorFolder
{
    /// <summary>
    /// Логика взаимодействия для DirectorReportWindow.xaml
    /// </summary>
    public partial class DirectorReportWindow : Window
    {
        public DirectorReportWindow()
        {
            InitializeComponent();
        }

        private void BtnMap_Click(object sender, RoutedEventArgs e)
        {
            DirectorMapWindow directorMapWindow = new DirectorMapWindow();
            directorMapWindow.Show();
            this.Close();
        }

        private void BtnUser_Click(object sender, RoutedEventArgs e)
        {
            DirectorUserListWindow directorUserListWindow = 
                new DirectorUserListWindow();
            directorUserListWindow.Show();
            this.Close();
        }

        private void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            MBClass.ExitMessageBox();
        }
    }
}
