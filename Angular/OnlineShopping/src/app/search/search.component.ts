import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
// import { HomeComponent } from '../home/home.component';
import {PdtService} from '../services/pdts.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.scss']
})
export class SearchComponent implements OnInit {

  products:any;
  name="";
  Name="";
  searchTerm: any;
   
  constructor(private PdtService:PdtService,private route:Router) {
    this.PdtService.getAllPdts().subscribe((data: any)=>{
      this.products=data;
    })
   }

  ngOnInit(): void {
  }

showDetails(id:number)
{
  this.ngOnInit();
  this.route.navigate(["Details",id])

}
OnSearch()
{
  this.name=this.Name;
}
OnClear()
{
  this.Name='';
  this.name=''
  this.route.navigate(["Home"])
}
 
  

} 
