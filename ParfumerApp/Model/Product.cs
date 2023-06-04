//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ParfumerApp.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Order = new HashSet<Order>();
        }
    
        public int ID { get; set; }
        public string Articul { get; set; }
        public string Title { get; set; }
        public int IDUnit { get; set; }
        public decimal Cost { get; set; }
        public int DiscountMax { get; set; }
        public string Manufacturer { get; set; }
        public string Supplier { get; set; }
        public int IDProductCategory { get; set; }
        public int Discount { get; set; }
        public int QuantityInStock { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
        public virtual ProductCategory ProductCategory { get; set; }
        public virtual Unit Unit { get; set; }
    }
}