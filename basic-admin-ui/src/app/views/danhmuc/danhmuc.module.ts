import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';

import { IconModule } from '@coreui/icons-angular';
import { ChartjsModule } from '@coreui/angular-chartjs';
import { ContentRoutingModule } from '../content/content-routing.module';
import { PostCategoryComponent } from '../content/post-categories/post-category.component';
import { PostCategoryDetailComponent } from '../content/post-categories/post-category-detail.component';
import { ProgressSpinnerModule } from 'primeng/progressspinner';
import { PanelModule } from 'primeng/panel';
import { BlockUIModule } from 'primeng/blockui';
import { PaginatorModule } from 'primeng/paginator';
import { BadgeModule } from 'primeng/badge';
import { CheckboxModule } from 'primeng/checkbox';
import { TableModule } from 'primeng/table';
import { KeyFilterModule } from 'primeng/keyfilter';
import { TeduSharedModule } from '../../../../src/app/shared/modules/tedu-shared.module';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { DropdownModule } from 'primeng/dropdown';
import { InputNumberModule } from 'primeng/inputnumber';
import { ImageModule } from 'primeng/image';
import { DynamicDialogModule } from 'primeng/dynamicdialog';
import { InputTextareaModule } from 'primeng/inputtextarea';
import { EditorModule } from 'primeng/editor';
import { AutoCompleteModule } from 'primeng/autocomplete';
import { PostDetailComponent } from '../content/posts/post-detail.component';
import { PostReturnReasonComponent } from '../content/posts/post-return-reason.component';
import { PostSeriesComponent } from '../content/posts/post-series.component';
import { PostActivityLogsComponent } from '../content/posts/post-activity-logs.component';
import { SeriesComponent } from '../content/series/series.component';
import { SeriesDetailComponent } from '../content/series/series-detail.component';
import { SeriesPostsComponent } from '../content/series/series-posts.component';
import { MatHangComponent } from './mathang/mathang.component';
import { DanhMucRoutingModule } from './danhmuc-routing.module';

@NgModule({
  imports: [
    DanhMucRoutingModule,
    IconModule,
    CommonModule,
    ReactiveFormsModule,
    ChartjsModule,
    ProgressSpinnerModule,
    PanelModule,
    BlockUIModule,
    PaginatorModule,
    BadgeModule,
    CheckboxModule,
    TableModule,
    KeyFilterModule,
    TeduSharedModule,
    ButtonModule,
    InputTextModule,
    InputTextareaModule,
    DropdownModule,
    EditorModule,
    InputNumberModule,
    ImageModule,
    AutoCompleteModule,
    DynamicDialogModule
  ],
  declarations: [
    MatHangComponent
  ]
})
export class DanhMucModule {
}
