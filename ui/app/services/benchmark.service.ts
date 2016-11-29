import { Injectable } from '@angular/core';
import { Benchmark } from '../classes/benchmark';
import { BENCHMARKS } from './mock-benchmarks';
@Injectable()
export class BenchmarkService {
  getHeroes(): Promise<Benchmark[]> {
    return Promise.resolve(BENCHMARKS);
  }
}