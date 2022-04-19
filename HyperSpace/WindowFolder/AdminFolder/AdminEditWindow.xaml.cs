using System;
using System.Collections.Generic;
using System.IO;
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
using HyperSpace.ClassFolder;
using HyperSpace.DataFolder;

namespace HyperSpace.WindowFolder.AdminFolder
{
	/// <summary>
	/// Логика взаимодействия для AdminEditWindow.xaml
	/// </summary>
	public partial class AdminEditWindow : Window
	{
		public AdminEditWindow(User User)
		{
			InitializeComponent();
			DataContext = User;
			var role = DBEntities.GetContext().Role
				.FirstOrDefault(s => s.IdRole == User.IdRole);			
			RoleTB.Text=role.NameRole;
		}

		private void SaveBtn_Click(object sender, RoutedEventArgs e)
		{
			User user = DBEntities.GetContext().User
				.FirstOrDefault(s => s.IdUser == VariableClass.IdUser);
			user.LoginUser = loginTB.Text;
			user.Role.NameRole = RoleTB.Text;

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
