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
using HyperSpace.DataFolder;
using HyperSpace.ClassFolder;

namespace HyperSpace.WindowFolder.AdminFolder
{
    /// <summary>
    /// Логика взаимодействия для AdminRegistrationWindow.xaml
    /// </summary>
    public partial class AdminRegistrationWindow : Window
    {
        User user = new User();
        public AdminRegistrationWindow()
        {
            InitializeComponent();
            DataContext = user;
        }

        private void RegistrationBtn_Click(object sender, RoutedEventArgs e)
        {
            AddUser();
            MBClass.MBInformation("Гуд");
            this.Close(); 
        }

        private void AddUser()
        {
            DBEntities.GetContext().User.Add(new User()
            {
                LoginUser = loginTB.Text,
                PasswordUser = PasswordTB.Text,
                IdRole = 2
            });            
            DBEntities.GetContext().SaveChanges();
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
            
        }
    }
}
