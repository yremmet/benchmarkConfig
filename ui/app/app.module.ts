import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule }   from '@angular/forms';
import { RouterModule }   from '@angular/router';
import { HttpModule }    from '@angular/http';
import {NG2D3Module} from 'ng2d3';

import { AppRoutingModule }     from './app-routing.module';
import { AppHttpClient }  from './app-http-client';
import { AppComponent }  from './app.component';

import { BenchmarkDetailComponent } from './components/benchmark-detail.component';
import { BenchmarksComponnent } from './components/benchmarks.component';
import { DashboardComponent } from './components/dashboard.component';
import { ChartComponent } from './components/chart.component';


import { BenchmarkService } from './services/benchmark.service';

@NgModule({
  imports:      [ BrowserModule,FormsModule,AppRoutingModule, HttpModule, NG2D3Module],
  declarations: [ AppComponent, BenchmarkDetailComponent, BenchmarksComponnent, DashboardComponent ],
  providers:    [ AppHttpClient, BenchmarkService ],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }
