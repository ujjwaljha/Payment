using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Payment.Models;
using Payment.Dto;
using System.Collections.Generic;
using Payment.Repositories;
using System.Threading.Tasks;
using Payment.ViewModel;
using System;

namespace Payment.Controllers
{
    public class PaymentController : Controller
    {
        private readonly IPaymentRepository paymentRepository;

        public PaymentController(IPaymentRepository paymentRepository)
        {
            this.paymentRepository = paymentRepository;
        }

        public async Task<IActionResult> Index(int package = 1)
        {
            var model = new PaymentViewModel
            {
                PaymentTypeOption = await paymentRepository.GetPaymentMethod(),
                FrequencyDiscountOption = await paymentRepository.GetPaymentFrequencyWithDiscount(package),
                Package = await paymentRepository.GetPackge(package)
            };

            return View(model);
        }

        public async Task<JsonResult> GetJson(int packageId = 1, int countryId = 1)
        {            
            return Json(await paymentRepository.GetPayment());
        }

        
    }
}
