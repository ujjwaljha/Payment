using System;
using System.Collections.Generic;

namespace Payment.Models
{
    public partial class Frequency
    {
        public Frequency()
        {
            Discount = new HashSet<Discount>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public byte MonthNumber { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifyOn { get; set; }
        public int? ModifyBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }

        public ICollection<Discount> Discount { get; set; }
    }
}
