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
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public List<string> sortList = new List<string>()
        {
            "По возрастанию", "По убыванию"
        };
        public List<string> filterList = new List<string>()
        {
            "Все", "от 0 до 5", "от 5 до 15","от 15 до 30","от 30 до 70","от 70 до 100",
        };
        public List<Product> Products { get; set; }
        public Product Product { get; set; }
        public MainPage(Product product)
        {
            InitializeComponent();
            Product = product;
            this.DataContext = this;
            SortFilter();
        }

        /// <summary>
        /// Метод сортировки и фильтрации
        /// </summary>
        private void SortFilter()
        {
            var products = AppData.db.Product.ToList();

            switch (cmdSort.SelectedIndex)
            {
                case 0:
                    products = products.OrderBy(x => x.Cost).ToList();
                    break;
                case 1:
                    products = products.OrderByDescending(x => x.Cost).ToList();
                    break;
            }

            switch (cmdFilter.SelectedIndex)
            {
                case 1:
                    products = products.Where(x => x.Discount >= 0 && x.Discount < 5).ToList();
                    break;
                case 2:
                    products = products.Where(x => x.Discount >= 10 && x.Discount < 15).ToList();
                    break;
                case 3:
                    products = products.Where(x => x.Discount >= 15 && x.Discount < 30).ToList();
                    break;
                case 4:
                    products = products.Where(x => x.Discount >= 30 && x.Discount < 70).ToList();
                    break;
                case 5:
                    products = products.Where(x => x.Discount >= 70 && x.Discount < 100).ToList();
                    break;
            }
            products = products.Where(x => x.Title.Contains(txbSearch.Text)).ToList();
            ProductList.ItemsSource = products;
           
        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductAction(new Product()));
        }

        /// <summary>
        /// Удаление товара из списка
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnDelProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var product = ProductList.SelectedItem as Product;
                if (product != null)
                {
                    if (MessageBox.Show("Вы действительно хотите удалить запись?", "Bнимаиие", MessageBoxButton.OKCancel, MessageBoxImage.Information) == MessageBoxResult.OK)
                    {
                    AppData.db.Product.Remove(product);
                    AppData.db.SaveChanges();
                    MessageBox.Show("Данные успешно удалены", "Bнимаиие", MessageBoxButton.OK, MessageBoxImage.Information);
                    Page_Loaded(null, null);

                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        /// <summary>
        /// Редактирование
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnEditProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var product = ProductList.SelectedItem as Product;
                if (product != null)
                {
                    NavigationService.Navigate(new ProductAction(new Product()));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }



        private void btnOrderList_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new OrderListPage(new Order()));
        }

        private void btnAddOrder_Click(object sender, RoutedEventArgs e)
        {

        }
        /// <summary>
        /// Загрузка списка 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Products = AppData.db.Product.ToList();
            ProductList.ItemsSource = Products;
            cmdSort.ItemsSource = sortList;
            cmdFilter.ItemsSource = filterList;
        }

        private void cmdFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortFilter();
        }

        private void cmdSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortFilter();

        }

        private void txbSearch_SelectionChanged(object sender, RoutedEventArgs e)
        {
            SortFilter();

        }
    }
}
