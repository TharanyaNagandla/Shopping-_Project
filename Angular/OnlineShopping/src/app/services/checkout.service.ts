import {HttpClient} from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable()
export class CheckoutService
{
  constructor(private getHttp:HttpClient)
  {

  }
  public getOrdersfromCart(id:number)
  {
    return this.getHttp.get("http://localhost:62520/api/checkout/"+id);
  }
}