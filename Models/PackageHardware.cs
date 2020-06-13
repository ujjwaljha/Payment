using System;
using System.Collections.Generic;

namespace Payment.Models
{
    public partial class PackageHardware
    {
        public int Id { get; set; }
        public int PackageId { get; set; }
        public int HardwareId { get; set; }
        public DateTime CreatedOn { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifyOn { get; set; }
        public int? ModifiyBy { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }

        public Hardware Hardware { get; set; }
        public Package Package { get; set; }
    }
}
