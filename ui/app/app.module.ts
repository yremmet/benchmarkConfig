import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule }   from '@angular/forms';

import { AppComponent }  from './app.component';

import { BenchmarkDetailComponent } from './components/benchmark-detail.component';

@NgModule({
  imports:      [ BrowserModule,FormsModule ],
  declarations: [ AppComponent, BenchmarkDetailComponent ],
  bootstrap:    [ AppComponent ]
})
export class AppModule { }
