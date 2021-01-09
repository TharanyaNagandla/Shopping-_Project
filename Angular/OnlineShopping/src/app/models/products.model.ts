export class Products
{
  Prod_Id:number;
  Prod_Name:string;
  Prod_Price:number;
  Prod_Image:any;
  Prod_Description:string;
  Prod_Quantity:number;
  Retail_Id:number;

  constructor(Prod_Id:number=0,Prod_Name:string="",Prod_Price:number=0,Prod_Image:any,Prod_Description:string="",Prod_Quantity:number=0,Retail_Id:number=0)
  {
    this.Prod_Id=Prod_Id;
    this.Prod_Name=Prod_Name;
    this.Prod_Price=Prod_Price;
    this.Prod_Image=Prod_Image;
    this.Prod_Description=Prod_Description;
    this.Prod_Quantity=Prod_Quantity;
    this.Retail_Id=Retail_Id;
  }
}

