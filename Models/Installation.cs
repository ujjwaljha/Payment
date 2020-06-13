using System;
using System.Collections.Generic;

namespace Payment.Models
{
    public partial class Installation
    {
        public int Id { get; set; }
        public int PackageId { get; set; }
        public decimal Price { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifyOn { get; set; }
        public int? ModifiyBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }

        public Package Package { get; set; }
    }
}
