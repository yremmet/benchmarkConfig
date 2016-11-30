import { Component, OnInit } from '@angular/core';
import { BenchmarkService } from '../services/benchmark.service';
import { Benchmark } from '../classes/benchmark';

@Component({
  selector: 'b-dashboard',
  template: `<h3>Dashboard</h3>
  <div class="grid grid-pad">

  <div *ngFor="let b of benchmarks" [routerLink]="['/benchmark', b.name]" class="col-1-4">
    <div class="module benchmark">
      <h4>{{b.name}}</h4>
    </div>
  </div>
</div>
  `,
  //styleUrls: [ 'dashboard.component.css' ],
  providers: [BenchmarkService]

})
export class DashboardComponent  { 
    benchmarks: Benchmark[] = [];

  constructor(private benchmarkService: BenchmarkService) { }

  ngOnInit(): void {
    this.benchmarkService.getBenchmarks()
      .then(b => this.benchmarks = b);
  }

 
}