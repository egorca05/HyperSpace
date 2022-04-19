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
using WpfGapeev.FolderWindows.FolderAdmin;

namespace WpfGapeev.FolderWindows.FolderAdmin
{
	/// <summary>
	/// Логика взаимодействия для WindowMenuAdmin.xaml
	/// </summary>
	public partial class WindowMenuAdmin : Window
	{
		public WindowMenuAdmin()
		{
			InitializeComponent();
		}

		private void BtnAddStaff_Click(object sender, RoutedEventArgs e)
		{
			WindowAddStaff windowAddStaff = new WindowAddStaff();
			windowAddStaff.Show();
			this.Close();
		}
	}
}
