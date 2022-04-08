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
    /// Логика взаимодействия для AdminPayUserWindow.xaml
    /// </summary>
    public partial class AdminPayUserWindow : Window
    {
        public AdminPayUserWindow(User User)
        {
            InitializeComponent();
            DataContext = User;
        }

        private void PayBtn_Click(object sender, RoutedEventArgs e)
        {
            User user = DBEntities.GetContext().User
                .FirstOrDefault(s => s.IdUser == VariableClass.IdUser);
            user.LoginUser = loginTB.Text;
            user.Balans += Convert.ToDecimal(PayTB.Text);

            DBEntities.GetContext().SaveChanges();
            MBClass.MBInformation("Успешно");
            this.Close();
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
