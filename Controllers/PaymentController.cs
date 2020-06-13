﻿using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Payment.Models;
using Payment.Dto;
using System.Collections.Generic;
using Payment.Repositories;

namespace Payment.Controllers
{
    public class PaymentController : Controller
    {
        private readonly IPaymentRepository paymentRepository;

        public PaymentController(IPaymentRepository paymentRepository)
        {
            this.paymentRepository = paymentRepository;
        }

        public IActionResult Index()
        {
            
            return View();
        }

        public JsonResult GetJson(int packageId = 1, int countryId = 1)
        {
            return Json(paymentRepository.GetPayment());
        }

        
    }
}
