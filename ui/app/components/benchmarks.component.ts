import { Component } from '@angular/core';
import { Benchmark } from '../classes/benchmark';
import { BenchmarkDetailComponent } from '../components/benchmark-detail.component';
import { BenchmarkService } from '../services/benchmark.service';


@Component({
  selector: 'benchmark-list',
  template: `
  <benchmark-detail [benchmark]="selectedBenchmark"></benchmark-detail>
   <ul class="benchmarks">
    <li *ngFor="let benchmark of benchmarks"
      [class.selected]="bechmark == selectedBenchmark"
      [routerLink]="['/benchmark', benchmark.id]" >
      <span class="badge">{{benchmark.id}}</span> {{benchmark.name}}
    </li>  
  </ul>
  `,
  styles: [`
  .selected {
    background-color: #CFD8DC !important;
    color: white;
  }
  .benchmarks {
    margin: 0 0 2em 0;
    list-style-type: none;
    padding: 0;
    width: 15em;
  }
  .benchmarks li {
    cursor: pointer;
    position: relative;
    left: 0;
    background-color: #EEE;
    margin: .5em;
    padding: .3em 0;
    height: 1.6em;
    border-radius: 4px;
  }
  .benchmarks li.selected:hover {
    background-color: #BBD8DC !important;
    color: white;
  }
  .benchmarks li:hover {
    color: #607D8B;
    background-color: #DDD;
    left: .1em;
  }
  .benchmarks .text {
    position: relative;
    top: -3px;
  }
  .benchmarks .badge {
    display: inline-block;
    font-size: small;
    color: white;
    padding: 0.8em 0.7em 0 0.7em;
    background-color: #607D8B;
    line-height: 1em;
    position: relative;
    left: -1px;
    top: -4px;
    height: 1.8em;
    margin-right: .8em;
    border-radius: 4px 0 0 4px;
  }
`],
  providers: [BenchmarkService]

})
export class BenchmarksComponnent  { 
  selectedBenchmark: Benchmark;
  benchmarks : Benchmark[];
  
  constructor(private benchmarkService: BenchmarkService) { }

  getBenchmarks(): void {
    this.benchmarkService.getBenchmarks().then(b => this.benchmarks = b);
  }
  ngOnInit(): void {
    this.getBenchmarks();
  }
  
  onSelect(benchmark: Benchmark): void {
    this.selectedBenchmark = benchmark;
  }

  
}




