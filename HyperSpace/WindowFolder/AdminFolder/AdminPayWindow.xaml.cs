﻿using System;
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
        }      

        private void PayCardBtn_Click(object sender, RoutedEventArgs e)
        {
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
    }
}
