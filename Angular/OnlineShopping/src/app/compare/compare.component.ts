import { Component, OnInit } from '@angular/core';
import {Products} from 'src/app/models/products.model'

@Component({
  selector: 'app-compare',
  templateUrl: './compare.component.html',
  styleUrls: ['./compare.component.scss']
})
export class CompareComponent implements OnInit {
  Prod_Id:any;
  Prod_Name:any;
  Prod_Price:any;
  Prod_Image:any;
  Prod_Description:any;
  Retail_Id:any;
  Product_Quantity:any;
  myCompareArray:Products[]=[{Prod_Id:0,Prod_Name:'',Prod_Price:0,Prod_Image:'',Prod_Description:'',Retail_Id:0,Prod_Quantity:0}];

  constructor() { }

  ngOnInit(): void {    
  }
  

  // myCompareArray=[
  //   {Prod_Id:0,Prod_Name:'',Prod_Price:'',Prod_Image:'',Prod_Description:'',Retail_Id:0,Product_Quantity:0}
  // ];

  CompareProducts(){
    this.myCompareArray.push({Prod_Id:this.Prod_Id,Prod_Name:this.Prod_Name,Prod_Price:this.Prod_Price,Prod_Image:this.Prod_Image,
    Prod_Description:this.Prod_Description,Retail_Id:this.Retail_Id,Prod_Quantity:this.Product_Quantity});
    console.log(this.myCompareArray);
  }

}
