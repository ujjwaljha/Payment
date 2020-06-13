using System.Collections.Generic;

namespace Payment.Dto
{
    public class Payment
    {
        public string PackId { get; set; }
        public string Country { get; set; }
        public IEnumerable<Packprice> PackPrice { get; set; }
    }
}
