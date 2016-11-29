import { Component, Input } from '@angular/core';
import { Benchmark } from '../classes/benchmark';

@Component({
  selector: 'benchmark-detail',
  template: `
  <div *ngIf="benchmark">
    <h2>{{benchmark.name}} details!</h2>
    <div><label>id: </label>{{benchmark.id}}</div>
    <div>
      <label>name: </label>
      <input [(ngModel)]="benchmark.name" placeholder="name"/>
    </div>
  </div>`
})

export class BenchmarkDetailComponent {
    @Input()
    benchmark: Benchmark;
}