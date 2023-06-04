using Microsoft.Win32;
using ParfumerApp.Context;
using ParfumerApp.Model;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ParfumerApp.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductAction.xaml
    /// </summary>
    public partial class ProductAction : Page
    {
        public  List<ProductCategory> ProductCategories { get; set; }
        public List<Unit> Units { get; set; }
        public Product Product { get; set; }
        public ProductAction(Product product)
        {
            InitializeComponent();
            Product = product;
            this.DataContext = this;
            ProductCategories = AppData.db.ProductCategory.ToList();
            Units = AppData.db.Unit.ToList();

        }
        /// <summary>
        /// Сохранение нового продукта с изображением
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Product.ID == 0)
                {
                    Product.GetPhoto = "\\products\\" + System.IO.Path.GetFileName(img.FileName);
                    AppData.db.Product.Add(Product);
                }
                File.Copy(img.FileName, $"products\\{System.IO.Path.GetFileName(img.FileName).Trim()}", true);
                Product.GetPhoto = "\\products\\" + System.IO.Path.GetFileName(img.FileName);
                AppData.db.SaveChanges();
                    MessageBox.Show("Данные успешно сохранены", "Внимание", MessageBoxButton.OK, MessageBoxImage.Information);
                    NavigationService.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        OpenFileDialog img = new OpenFileDialog();
        /// <summary>
        /// Фильтр для изображений
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SelectBtn_Click(object sender, RoutedEventArgs e)
        {
            img.Filter = "Image (*.jpg;*.jpeg;*.png;) |  *.jpg; *.jpeg; *.png";
            if (img.ShowDialog() == true)
            {
                BitmapImage image = new BitmapImage(new Uri(img.FileName));
                Img.Source = image;
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
