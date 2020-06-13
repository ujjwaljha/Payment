using System;
using System.Collections.Generic;

namespace Payment.Models
{
    public partial class Discount
    {
        public int Id { get; set; }
        public int PackageId { get; set; }
        public int FrequencyId { get; set; }
        public byte DiscountPercent { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifyOn { get; set; }
        public int? ModifiyBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }

        public Frequency Frequency { get; set; }
        public Package Package { get; set; }
    }
}
