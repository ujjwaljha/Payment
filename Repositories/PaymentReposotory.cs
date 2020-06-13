using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Payment.Dto;
using Payment.Models;

namespace Payment.Repositories
{
    public class PaymentReposotory : IPaymentRepository
    {
        public PaymentReposotory(PaymentContext context)
        {
            Context = context;
        }

        public PaymentContext Context { get; }

        public Dto.Payment GetPayment(int countryId = 1, int packageId = 1)
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
            var discountes = Context.Discount
                .Where(m => m.IsActive == true && m.IsDeleted == false && m.PackageId == packageId)
                .Select(m => new { m.Id, m.FrequencyId, m.DiscountPercent }).ToList();

            // ToList as all set is require for the end result
            var installations = Context.Installation
                .Where(m => m.IsActive == true && m.IsDeleted == false && m.PackageId == packageId)
                .Sum(m => m.Price);


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
