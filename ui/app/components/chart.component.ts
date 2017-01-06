import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'chart',
  template: `
   <bar-vertical
      [view]="view"
      [scheme]="colorScheme"
      [results]="results"
      [gradient]="gradient"
      [xAxis]="showXAxis"
      [yAxis]="showYAxis"
      [legend]="showLegend"
      [showXAxisLabel]="showXAxisLabel"
      [showYAxisLabel]="showYAxisLabel"
      [xAxisLabel]="xAxisLabel"
      [yAxisLabel]="yAxisLabel"
      (clickHandler)="clickHandler($event)">
    </bar-vertical>
  `,
  providers: []

})
export class ChartComponent implements OnInit { 
    
  constructor() { }

  ngOnInit(): void {
  }

  results= [
      {
          'name' : 'Mock 1',
          'value': 100
      },
      {
        'name': 'Mock 2',
        'value': 200
      }
  ];
  // View
  view: any[] = [700, 400];


  // options
  showXAxis = true;
  showYAxis = true;
  gradient = false;
  showLegend = true;
  showXAxisLabel = true;
  xAxisLabel = 'B';
  showYAxisLabel = true;
  yAxisLabel = 'A';

  colorScheme = {
    domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA']
  };

 
}