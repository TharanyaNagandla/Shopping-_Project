import {HttpClient} from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable()
export class OrderService
{
  constructor(private getHttp:HttpClient)
  {

  }
  public getOrders(id:number)
  {
    return this.getHttp.get("http://localhost:62520/api/orders/"+id);
  }
}