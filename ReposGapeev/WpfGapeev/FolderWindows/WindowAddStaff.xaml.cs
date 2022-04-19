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
	/// Логика взаимодействия для WindowAddStaff.xaml
	/// </summary>
	public partial class WindowAddStaff : Window
	{
		Staff staff = new Staff();
		User user = new User();
		public WindowAddStaff()
		{
			InitializeComponent();
			DataContext=staff;
			CBRoleStaff.ItemsSource=DBEntities.GetContext()
				.Role.ToList();
		}

		private void BtnSave_Click(object sender, RoutedEventArgs e)
		{
			if (string.IsNullOrEmpty(TbFirstNameStaff.Text))
				{
				ClassMB.MBerror("Вы не ввели имя");
				TbFirstNameStaff.Focus();
			}
			else if (string.IsNullOrEmpty(TbLastNameStaff.Text))
			{
				ClassMB.MBerror("Вы не ввели фамилию");
				TbLastNameStaff.Focus();
			}
			else
			{ 
				
				AddUser();
				AddStaff();
				ClassMB.MBinformation("Успешно добавлен");
			}
		}

		private void AddUser()
		{ 
			var userAdd=new User()
			{ 
				LoginUser=TbLoginStaff.Text,
				PasswordUser=TbPasswordStaff.Text,
				IdRole=Int32.Parse(CBRoleStaff.SelectedValue.ToString()),
				};
			DBEntities.GetContext().User.Add(userAdd);
			DBEntities.GetContext().SaveChanges();
			user.IdUser=userAdd.IdUser;
			}

		private void AddStaff()
		{ 
			var staffAdd=new Staff()
			{
				LastNameStaff=TbLastNameStaff.Text,
				FirstNameStaff=TbFirstNameStaff.Text,
				MiddleNameStaff=TbMiddleNameStaff.Text,
				DateOfBirthStaff=DateTime.Parse(TbDateOfBirthStaff.Text),
				EmailStaff=TbEmailStaff.Text,
				IdUser = user.IdUser,
			};
			DBEntities.GetContext().Staff.Add(staffAdd);
			DBEntities.GetContext().SaveChanges();
			}

		private void BtnBack_Click(object sender, RoutedEventArgs e)
		{

		}
	}
}
