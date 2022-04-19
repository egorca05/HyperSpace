using HyperSpace.ClassFolder;
using HyperSpace.DataFolder;
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

namespace HyperSpace.WindowFolder.DirectorFolder
{
	/// <summary>
	/// Логика взаимодействия для DirectorEditWindow.xaml
	/// </summary>
	public partial class DirectorEditWindow : Window
	{
		public DirectorEditWindow(User User)
		{
			InitializeComponent();
			DataContext = User;
			RoleCB.ItemsSource = DBEntities.GetContext()
				.Role.ToList();
		}

		private void ExitBtn_Click(object sender, RoutedEventArgs e)
		{
			this.Close();
		}

		private void SaveBtn_Click(object sender, RoutedEventArgs e)
		{
			User user = DBEntities.GetContext().User
				.FirstOrDefault(s => s.IdUser == VariableClass.IdUser);
			user.LoginUser = loginTB.Text;
			user.Role.NameRole = RoleCB.Text;

			DBEntities.GetContext().SaveChanges();
			MBClass.MBInformation("Успешно");
			this.Close();
		}
	}
}
