import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './home/home.component';
import { ComponentsModule } from '../components/components.module';
import { PagesRoutingModule } from './pages-routing.module';

const components: any = [
  HomeComponent
]

@NgModule({
  declarations: components,
  imports: [
    CommonModule,
    ComponentsModule,
    PagesRoutingModule
  ],
  exports: components,
  providers: [],
  bootstrap: []
})
export class PagesModule { }
