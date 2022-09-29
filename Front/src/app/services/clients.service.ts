import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Client } from '../models/clients.dto';

@Injectable({
  providedIn: 'root'
})
export class ClientsService {

  private API_URL: string = environment.API_URL

  constructor( private http: HttpClient ) { }

  public getAllClientsOrFilterById(identification_card: string = ''): Observable<any[]> {
    return this.http.get<any[]>(`${this.API_URL}values/${identification_card}`)
    .pipe(
      map((clients: any[]) => clients.map(client => ({
        identification_card: client.cedula,
        full_name: client.nombre,
        amount: client.monto,
        date: client.fecha,
      })))
    )
  }

}
