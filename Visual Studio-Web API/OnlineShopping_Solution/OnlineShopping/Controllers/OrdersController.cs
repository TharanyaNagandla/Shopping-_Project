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
    public class OrdersController : ApiController
    {
        Project_ShoppingEntities entities = new Project_ShoppingEntities();

        public HttpResponseMessage GetOrders(int id)
        {
            List<Order> orders = new List<Order>();
            var res = entities.sp_getOrders1(id).ToList();
            foreach(var item in res.ToList())
            {
                orders.Add(new Order { Order_Id = item.Order_Id, Prod_Quantity = item.Prod_Quantity, Prod_Name = item.Prod_Name, Prod_Price = item.Prod_Price,Prod_Image=item.Prod_Image });

            }
            return Request.CreateResponse(HttpStatusCode.OK, orders);
        }
    

    }
}
