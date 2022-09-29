import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Payments } from 'src/app/models/Payments.dto';

@Component({
  selector: 'app-filter-search',
  templateUrl: './filter-search.component.html',
  styleUrls: ['./filter-search.component.css']
})
export class FilterSearchComponent implements OnInit {

  @Output() identification_card: EventEmitter<string> = new EventEmitter<string>()
  filters: any = {}

  buttonOptions: any = {
    text: 'Buscar',
    icon: 'search',
    type: 'success',
    useSubmitBehavior: true,
  };

  constructor() {}

  ngOnInit(): void {

  }

  returnFilter(event: Event) {
    event.preventDefault()
    this.identification_card.emit(this.filters?.identification_card)
  }

}
