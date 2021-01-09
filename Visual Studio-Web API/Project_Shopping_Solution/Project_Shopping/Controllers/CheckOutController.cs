using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Project_Shopping.Models;

namespace Project_Shopping.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class CheckOutController : ApiController
    {
        Project_ShoppingEntities entities = new Project_ShoppingEntities();

        public HttpResponseMessage InsintoOrders(int id)
        {
            //List<Order> order = new List<Order>();
            //var res = entities.sp_ins_order(id).ToList();
            //foreach (var item in res.ToList())
            //{
            //    order.Add(new Order { Prod_Name = item.Prod_Name, Prod_Price = item.Prod_Price });

            //}
            //return Request.CreateResponse(HttpStatusCode.OK, order);
        }
    }
}
