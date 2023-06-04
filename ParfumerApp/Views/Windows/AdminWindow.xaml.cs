using ParfumerApp.Model;
using ParfumerApp.Views.Pages;
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

namespace ParfumerApp.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public User User { get; set; }
        public AdminWindow(User user)
        {
            InitializeComponent();
            User = user;
            this.DataContext = this;
            MainFrame.Navigate(new MainPage(new Product()));
            tlbUserName.Text = $"Пользователь:{user.FirstName} {user.LastName} {user.Patronymic}";            

        }
    }
}
