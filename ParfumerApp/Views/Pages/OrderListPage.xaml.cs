using ParfumerApp.Context;
using ParfumerApp.Model;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ParfumerApp.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderListPage.xaml
    /// </summary>
    public partial class OrderListPage : Page
    {
        public Product Product { get; set; }
        public Order Order { get; set; }
        public List<Order> Orders { get; set; }
        public OrderListPage(Order order)
        {
            InitializeComponent();
            Order = order;
            this.DataContext = this;
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void AddOrderBtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new OrderActionPage(new Order()));
        }
        /// <summary>
        /// Редактирование заказа
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void EditOrderBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var order = OrderData.SelectedItem as Order;
                if (order != null)
                {
                    NavigationService.Navigate(new OrderActionPage(order));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        /// <summary>
        /// Загрузка элементов
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Orders = AppData.db.Order.ToList();
            OrderData.ItemsSource = Orders;
        }
    }
}
