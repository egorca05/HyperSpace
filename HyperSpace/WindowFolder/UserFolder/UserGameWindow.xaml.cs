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
            //Адаптация под логин и баланс 
            LoginLbl.Content = context.user.LoginUser;
            BalansLbl.Content = context.user.Balans;
            TimeIn();
        }

        private void TimeIn()
        {
            Random random = new Random();
            var temp = DBEntities.GetContext().Sale.Add(new Sale()
            {
                IdUser = context.user.IdUser,
                TimeInSale = DateTime.Now,
                IdPC = random.Next(1, 6),
                IdTarif = random.Next(1, 3),
            });
            DBEntities.GetContext().SaveChanges();
            context.sale = temp;
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Sale sale = DBEntities.GetContext().Sale
                .FirstOrDefault(s => s.IdSale == context.sale.IdSale);
            sale.TimeOutSale = DateTime.Now;
            DBEntities.GetContext().SaveChanges();
            this.Close();

        }
    }
}
