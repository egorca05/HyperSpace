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
    /// Логика взаимодействия для DirectorMapWindow.xaml
    /// </summary>
    public partial class DirectorMapWindow : Window
    {
        public DirectorMapWindow()
        {
            InitializeComponent();
        }

        private void BtnReport_Click(object sender, RoutedEventArgs e)
        {
            DirectorReportWindow directorReportWindow =
                new DirectorReportWindow();
            directorReportWindow.Show();
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
        public class Work
        {
            public static int work1;
            public static int work2;
            public static int work3;
        }

        private void BtnPower_Click(object sender, RoutedEventArgs e)
        {
            if (Work.work1 == 1)
            {
                PC1.BorderBrush = Brushes.Green;
            }
            if (Work.work2 == 1)
            {
                PC2.BorderBrush = Brushes.Green;
            }
            if (Work.work3 == 1)
            {
                PC3.BorderBrush = Brushes.Green;
            }
        }
        private void BtnRestart_Click(object sender, RoutedEventArgs e)
        {
            if (Work.work1 == 1)
            {
                PC1.BorderBrush = Brushes.Yellow;
            }
            if (Work.work2 == 1)
            {
                PC2.BorderBrush = Brushes.Yellow;
            }
            if (Work.work3 == 1)
            {
                PC3.BorderBrush = Brushes.Yellow;
            }
        }

        private void BtnUpDate_Click(object sender, RoutedEventArgs e)
        {
            if (Work.work1 == 1)
            {
                PC1.BorderBrush = Brushes.Red;
            }
            if (Work.work2 == 1)
            {
                PC2.BorderBrush = Brushes.Red;
            }
            if (Work.work3 == 1)
            {
                PC3.BorderBrush = Brushes.Red;
            }
        }
        private void PC1_Checked(object sender, RoutedEventArgs e)
        {
            Work.work1 = 1;
        }
        private void PC1_Unchecked(object sender, RoutedEventArgs e)
        {
            Work.work1 = 0;
        }

        private void PC2_Checked(object sender, RoutedEventArgs e)
        {
            Work.work2 = 1;
        }

        private void PC2_Unchecked(object sender, RoutedEventArgs e)
        {
            Work.work2 = 0;
        }

        private void PC3_Checked(object sender, RoutedEventArgs e)
        {
            Work.work3 = 1;
        }

        private void PC3_Unchecked(object sender, RoutedEventArgs e)
        {
            Work.work3 = 0;
        }

		private void BtnWarning_Click(object sender, RoutedEventArgs e)
		{
            MBClass.MBInformation("Выдано предупреждение");
		}
	}
}
