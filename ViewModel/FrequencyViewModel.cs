using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Payment.ViewModel
{
    public class FrequencyDiscountViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int MonthNumber { get; set; }
        public int DiscountPercent { get; set; }
    }
}
