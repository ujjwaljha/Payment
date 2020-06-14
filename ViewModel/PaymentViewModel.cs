using Payment.Dto;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Payment.ViewModel
{
    public class PaymentViewModel
    {
        public IEnumerable<LookUp> PaymentTypeOption { get; set; }
        [Required]
        public int PaymentType { get; set; }

        public IEnumerable<FrequencyDiscountViewModel> FrequencyDiscountOption { get; set; }
        public int FrequencyDiscount { get; set; }

        public decimal Package { get; set; }

    }
}
