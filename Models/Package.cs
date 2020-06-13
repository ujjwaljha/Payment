using System;
using System.Collections.Generic;

namespace Payment.Models
{
    public partial class Package
    {
        public Package()
        {
            Discount = new HashSet<Discount>();
            Installation = new HashSet<Installation>();
            PackageHardware = new HashSet<PackageHardware>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifyOn { get; set; }
        public int? ModifyBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }

        public ICollection<Discount> Discount { get; set; }
        public ICollection<Installation> Installation { get; set; }
        public ICollection<PackageHardware> PackageHardware { get; set; }
    }
}
