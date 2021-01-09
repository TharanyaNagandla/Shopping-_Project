using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using OnlineShopping.Models;

namespace OnlineShopping.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class CheckOutController : ApiController
    {
        Project_ShoppingEntities entities = new Project_ShoppingEntities();

        [HttpGet]

        public HttpResponseMessage GetOrdersfromCart(int id)
        {
            List<Order> order = new List<Order>();
            var res = entities.sp_getOrdersfromCart(id).ToList();
            foreach (var item in res.ToList())
            {
                order.Add(new Order { Prod_Name = item.Prod_Name, Prod_Price = item.Prod_Price });
            }
            return Request.CreateResponse(HttpStatusCode.OK, order);
        }
        [HttpPut]
        public HttpResponseMessage InsertIntoOrders(int id)
        {
            var r = entities.sp_ins_order(id);
            entities.SaveChanges();
            return Request.CreateResponse(HttpStatusCode.OK);

            //foreach (var item in res.ToList())
            //{
            //    orderstbl.Add(new Order { Prod_Name = item.Prod_Name, Prod_Price = item.Prod_Price });

            //}
            //
        }


    }
}
