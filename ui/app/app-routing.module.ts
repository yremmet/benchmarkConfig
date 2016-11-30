import { NgModule }      from '@angular/core';
import { RouterModule }   from '@angular/router';


import { BenchmarkDetailComponent } from './components/benchmark-detail.component';
import { BenchmarksComponnent } from './components/benchmarks.component';
import { DashboardComponent } from './components/dashboard.component';

const routes: Routes = [
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: 'dashboard',  component: DashboardComponent },
  { path: 'benchmark/:id', component: BenchmarkDetailComponent },
  { path: 'benchmarks',     component: BenchmarksComponnent }
];
@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule {}