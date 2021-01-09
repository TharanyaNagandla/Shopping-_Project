import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OrderService } from '../services/orders.service';


@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.scss']
})
export class OrdersComponent implements OnInit {

  id:number;
  order:any;
  constructor(private myRoute:ActivatedRoute,private orderService:OrderService,private route:Router) { 
    this.ngOnInit();
    this.id= this.myRoute.snapshot.params["id"];
    console.log(this.id);
    this.orderService.getOrders(this.id).subscribe(data=>
     this.order=data);
      
  }
  orderPlaced(){
    this.ngOnInit();
    this.route.navigate(["thankyoupage"])

  }

  ngOnInit(): void {
  }
  
  // countPrice(){
  //    this.Price = 0;
  //     for(let p of this.ordersArray){
  //       this.Price += p.price*p.quantity
  //     }
  // }

}
