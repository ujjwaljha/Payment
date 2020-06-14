using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Payment.Dto;
using Payment.Models;
using Payment.ViewModel;

namespace Payment.Repositories
{
    public class PaymentReposotory : IPaymentRepository
    {
        public PaymentReposotory(PaymentContext context)
        {
            Context = context;
        }

        public PaymentContext Context { get; }

        public async Task<Dto.Payment> GetPayment(int countryId = 1, int packageId = 1)
        {
            var paymentMethods = Context.PaymentMethod
                .Where(m => m.IsActive == true && m.IsDeleted == false)
                .Select(m => new { m.Id, m.Name });

            var packages = Context.Package
                .Where(m => m.IsActive == true && m.IsDeleted == false && m.Id == packageId)
                .Select(m => new { m.Id, m.Name, m.Price }).FirstOrDefault();



            var frequencies = Context.Frequency
                .Where(m => m.IsActive == true && m.IsDeleted == false)
                .Select(m => new { m.Id, m.Name, m.MonthNumber });

            // ToList as all set is require for the end result
            var discountes = await Context.Discount
                .Where(m => m.IsActive == true && m.IsDeleted == false && m.PackageId == packageId)
                .Select(m => new { m.Id, m.FrequencyId, m.DiscountPercent }).ToListAsync();

            // ToList as all set is require for the end result
            var installations = await Context.Installation
                .Where(m => m.IsActive == true && m.IsDeleted == false && m.PackageId == packageId)
                .SumAsync(m => m.Price);


            var hardwarePrice = (from hardware in Context.Hardware
                                 join packageHardware in Context.PackageHardware on hardware.Id equals packageHardware.HardwareId
                                 where hardware.IsActive == true
                                     && hardware.IsDeleted == false
                                     && packageHardware.IsActive == true
                                     && packageHardware.IsDeleted == false
                                     && packageHardware.PackageId == packages.Id
                                 select new { hardware.Price }).Sum(m => m.Price);



            var packPrice = paymentMethods
                .Select(m => new Packprice
                {
                    Method = m.Name,
                    InvoicePeriod = frequencies.Select(n =>
                    new Invoiceperiod
                    {
                        Frequency = n.MonthNumber.ToString(),
                        Price = CalcualtePrice(packages.Price,
                        discountes.FirstOrDefault(o => o.FrequencyId == n.Id).DiscountPercent,
                        installations, hardwarePrice)
                    })
                });


            return new Dto.Payment
            {
                Country = countryId.ToString(),
                PackId = packageId.ToString(),
                PackPrice = packPrice
            };
        }

        public async Task<List<LookUp>> GetPaymentMethod()
        {
            //return await Context.PaymentMethod
            //    .Where(m => m.IsActive == true && m.IsDeleted == false)
            //    .Select(m => new LookUp { Id = m.Id, Text = m.Name }).ToListAsync();

            return await (from paymentMethod in Context.PaymentMethod
                          where paymentMethod.IsActive && !paymentMethod.IsDeleted
                          select new LookUp { Id = paymentMethod.Id, Text = paymentMethod.Name }).ToListAsync();

        }

        public async Task<List<FrequencyDiscountViewModel>> GetPaymentFrequencyWithDiscount( int packageId = 1)
        {
            return await (from frequency in Context.Frequency
                          join discount in Context.Discount on frequency.Id equals discount.FrequencyId
                        where frequency.IsActive && !frequency.IsDeleted && discount.IsActive && !discount.IsDeleted
                        select new FrequencyDiscountViewModel { Id=  frequency.Id, MonthNumber = frequency.MonthNumber, Name= frequency.Name, DiscountPercent = discount.DiscountPercent }).ToListAsync();
        }

        public async Task<decimal> GetPackge(int packageId = 1)
        {
            return await Context.Package
                .Where(m => m.IsActive == true && m.IsDeleted == false && m.Id == packageId)
                .Select(m =>  m.Price ).FirstOrDefaultAsync();
        }

        private Price CalcualtePrice(decimal pack, byte discountPerc, decimal installaiton, decimal hardware)
        {
            return new Price
            {
                DiscountPerc = discountPerc.ToString(),
                Hardware = hardware.ToString(),
                Installation = installaiton.ToString(),
                Pack = pack.ToString(),
            };
        }
    }
}
