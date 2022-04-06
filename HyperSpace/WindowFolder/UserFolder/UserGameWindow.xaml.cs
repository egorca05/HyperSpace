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

namespace HyperSpace.WindowFolder.UserFolder
{
    /// <summary>
    /// Логика взаимодействия для UserGameWindow.xaml
    /// </summary>
    public partial class UserGameWindow : Window
    {
        public UserGameWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            LoginLbl.Content = context.user.LoginUser;
            BalansLbl.Content = context.user.Balans;
        }
    }
}
