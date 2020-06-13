using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Payment.Repositories
{
    public interface IPaymentRepository
    {
        Dto.Payment GetPayment(int countryId = 1, int packageId = 1);
        //void GetPayment(int discountId);
    }
}
