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
    /// Логика взаимодействия для WindowListСlient.xaml
    /// </summary>
    public partial class WindowListСlient : Window
    {
        public WindowListСlient()
        {
            InitializeComponent();
            DGListClient.ItemsSource = DBEntities.GetContext().Client.ToList().
                OrderBy(c => c.LastNameClient);
        }

        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                DGListClient.ItemsSource = DBEntities.GetContext().Client
                    .Where(c => c.LastNameClient.StartsWith(SearchTb.Text)
                    || c.FirstNameClient.StartsWith(SearchTb.Text)).ToList();

                if (DGListClient.Items.Count <= 0)
                    ClassMB.MBerror("Клиент не найден в системе");
            }
            catch (Exception ex)
            {
                ClassMB.MBerror(ex);
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            WindowAddClient windowAddClient = new WindowAddClient();
            windowAddClient.Show();
            this.Close();
        }

        private void DGListClient_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (DGListClient.SelectedItem == null)
            { 
                ClassMB.MBerror("Не выбран клиент для редактирования");              
            }
            else 
            {
            Client client = DGListClient.SelectedItem as Client;
                ClassVariable.IdClient = client.IdClient;
                new WindowEdit(DGListClient.SelectedItem as Client).ShowDialog();
                DGListClient.ItemsSource = DBEntities.GetContext().Client.ToList().
                OrderBy(c => c.LastNameClient);
            }
        }

		private void BtnAddStaff_Click(object sender, RoutedEventArgs e)
		{

		}
	}
}
