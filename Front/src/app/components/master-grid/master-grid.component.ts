import { Component, OnInit } from '@angular/core';
import { Client } from 'src/app/models/clients.dto';
import { ClientsService } from 'src/app/services/clients.service';

@Component({
  selector: 'app-master-grid',
  templateUrl: './master-grid.component.html',
  styleUrls: ['./master-grid.component.css']
})
export class MasterGridComponent implements OnInit {

  /* Props of dxGrid */
  collapsed = false

  clientDataSource: Client[] = []

  constructor(private _clientService: ClientsService) { }

  ngOnInit(): void {
    this.getAllClientsOrFilterById()
  }

  getAllClientsOrFilterById( identification_card: string = '' ): void{
    this._clientService.getAllClientsOrFilterById( identification_card )
    .subscribe((clients: Client[]) => {
      this.clientDataSource = clients
    })
  }

  /* Methods of dxGrid */
  contentReady = (e: any) => {
    if (!this.collapsed) {
      this.collapsed = true
      e.component.expandRow(['EnviroCare'])
    }
  }

}
