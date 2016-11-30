import { Injectable } from '@angular/core';
import { Benchmark } from '../classes/benchmark';
import { BENCHMARKS } from './mock-benchmarks';
import { AppHttpClient }  from '../app-http-client';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class BenchmarkService {
  constructor (private http: AppHttpClient){}

  private url = "/benchmarks";
  getBenchmarks(): Promise<Benchmark[]> {
    return this.http.get(this.url).toPromise()
        .then(r => r.json()['_embedded'].benchmarks as Benchmark[])
        .catch(this.handleError);

     
  }

  private handleError(error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }

  getBenchmark(id: number): Promise<Benchmark> {
  return this.getBenchmarks()
             .then(benchmarks => benchmarks.find(benchmark => benchmark.id === id));
  }
  
  getBenchmark(link: string): Promise<Benchmark> {
  return this.getBenchmarks()
             .then(benchmarks => benchmarks.find(benchmark => benchmark.id === id));
  }
}