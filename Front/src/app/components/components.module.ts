import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DetailGridComponent } from './detail-grid/detail-grid.component';
import { DxBulletModule, DxDataGridModule, DxFormModule, DxTabPanelModule, DxTemplateModule } from 'devextreme-angular';
import { MasterGridComponent } from './master-grid/master-grid.component';
import { FilterSearchComponent } from './filter-search/filter-search.component';

const components = [
  MasterGridComponent,
  DetailGridComponent,
  FilterSearchComponent
]

@NgModule({
  declarations: components,
  imports: [
    CommonModule,
    DxDataGridModule,
    DxTemplateModule,
    DxBulletModule,
    DxFormModule,
    DxTabPanelModule,
  ],
  exports: components
})
export class ComponentsModule { }
