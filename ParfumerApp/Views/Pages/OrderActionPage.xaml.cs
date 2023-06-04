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
    /// Логика взаимодействия для OrderActionPage.xaml
    /// </summary>
    public partial class OrderActionPage : Page
    {
        public List<Product> Products { get; set; }
        public List<OrderStatus> OrderStatuses { get; set; }
        public Order Order { get; set; }
        public OrderActionPage(Order order)
        {
            InitializeComponent();
            Order = order;
            this.DataContext = this;
            OrderStatuses = AppData.db.OrderStatus.ToList();
            Products = AppData.db.Product.ToList();
        }
        /// <summary>
        /// Сохранение нового заказа
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OrderSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
     
                if (Order.ID == 0)
                {
                    AppData.db.Order.Add(Order);
                }
                AppData.db.SaveChanges();
                MessageBox.Show("Данные успешно добавлены", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();         
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        /// <summary>
        /// Перехад на предыдущуб страницу
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack(); 
        }
    }
}
