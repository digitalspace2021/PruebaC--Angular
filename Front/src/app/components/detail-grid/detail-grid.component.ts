import { Component, Input, OnInit } from '@angular/core';
import { Payments } from 'src/app/models/Payments.dto';

@Component({
  selector: 'app-detail-grid',
  templateUrl: './detail-grid.component.html',
  styleUrls: ['./detail-grid.component.css']
})
export class DetailGridComponent implements OnInit {

  @Input() payments : Payments[] = []

  constructor() {}

  ngOnInit(): void {
  }

}
