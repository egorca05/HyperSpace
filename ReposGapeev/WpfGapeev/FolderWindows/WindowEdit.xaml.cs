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
using WpfGapeev.FolderData;
using WpfGapeev.FolderClass;

namespace WpfGapeev.FolderWindows
{
    /// <summary>
    /// Логика взаимодействия для WindowEdit.xaml
    /// </summary>
    public partial class WindowEdit : Window
    {
        public WindowEdit(Client Client)
        {
            InitializeComponent();
            DataContext = Client;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            Client client = DBEntities.GetContext().Client
                .FirstOrDefault(s => s.IdClient == ClassVariable.IdClient);
            client.LastNameClient = TbLastNameClient.Text;
            client.FirstNameClient = TbFirstNameClient.Text;
            client.MiddleNameClient = TbMiddleNameClient.Text;
            client.PhoneClient = TbPhoneClient.Text;
            client.EmailClient = TbEmailClient.Text;

            DBEntities.GetContext().SaveChanges();
            ClassMB.MBinformation("Успешно");
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
