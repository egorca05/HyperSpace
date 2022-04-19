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
    /// Логика взаимодействия для WindowAddClient.xaml
    /// </summary>
    public partial class WindowAddClient : Window
    {
        Client client = new Client();
        public WindowAddClient()
        {
            InitializeComponent();
            DataContext = client;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            DBEntities.GetContext().Client.Add(client);
            DBEntities.GetContext().SaveChanges();
            ClassMB.MBinformation("Клиент успешно добавлен");
            
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            WindowListСlient windowListСlient = new WindowListСlient();
            windowListСlient.Show();
            this.Close();
        }
    }
}
