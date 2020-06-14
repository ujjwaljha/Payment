using Payment.Dto;
using Payment.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Payment.Repositories
{
    public interface IPaymentRepository
    {
        Task<Dto.Payment> GetPayment(int countryId = 1, int packageId = 1);
        Task<List<LookUp>> GetPaymentMethod();
        Task<List<FrequencyDiscountViewModel>> GetPaymentFrequencyWithDiscount(int packageId = 1);
        Task<decimal> GetPackge(int packageId = 1);
    }
}
