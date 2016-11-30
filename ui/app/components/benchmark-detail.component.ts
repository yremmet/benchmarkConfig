import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Params }   from '@angular/router';
import { Location }                 from '@angular/common';

import { Benchmark } from '../classes/benchmark';
import { BenchmarkService } from '../services/benchmark.service';

import 'rxjs/add/operator/switchMap';


@Component({
  selector: 'benchmark-detail',
  moduleId: module.id,
  templateUrl: 'benchmark-detail.component.hmtl',
  styleUrls: [ 'benchmark-detail.component.css' ],
  providers: [BenchmarkService]

})

export class BenchmarkDetailComponent implements OnInit {
    @Input()
    benchmark: Benchmark;

    constructor(
        private benchmarkService: BenchmarkService,
        private route: ActivatedRoute,
        private location: Location
    )   {}

    ngOnInit(): void {
      this.route.params
      .switchMap((params: Params) => this.benchmarkService.getBenchmark(+params['id']))
      .subscribe(benchmark => this.benchmark = benchmark);
    }

    goBack(): void {
      this.location.back();
    }
}