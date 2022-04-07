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

namespace HyperSpace.WindowFolder.DirectorFolder
{
    /// <summary>
    /// Логика взаимодействия для DirectorRegistrationWindow.xaml
    /// </summary>
    public partial class DirectorRegistrationWindow : Window
    {
        public DirectorRegistrationWindow()
        {
            InitializeComponent();
            RoleCB.ItemsSource = DBEntities.GetContext()
                .Role.ToList();
        }

        private void RegistrationBtn_Click(object sender, RoutedEventArgs e)
        {
            AddUser();
            MBClass.MBInformation("Пользователь успешно зарегестрирован");
            this.Close();
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        private void AddUser()
        {
            DBEntities.GetContext().User.Add(new User()
            {
                LoginUser = loginTB.Text,
                PasswordUser = PasswordTB.Text,
                IdRole = Int32.Parse(RoleCB.SelectedValue.ToString())
            });
            DBEntities.GetContext().SaveChanges();
        }
    }
}
