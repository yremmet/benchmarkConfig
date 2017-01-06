import { Component } from '@angular/core';
import { ChartComponent } from './components/chart.component';
@Component({
  selector: 'my-app',
  template: `
    <h1>{{title}}</h1>
    <nav>
      <a routerLink="/dashboard">Dashboard</a>
      <a routerLink="/benchmarks">Benchmarks</a> 
   </nav>
    
   <router-outlet></router-outlet>
   <chart>
  `
  
})
export class AppComponent {
  title = 'Benchmarks';
}
