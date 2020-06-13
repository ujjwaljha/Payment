using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Payment.Dto
{
    public class Packprice
    {
        public string Method { get; set; }
        public IEnumerable<Invoiceperiod> InvoicePeriod { get; set; }
    }
}
