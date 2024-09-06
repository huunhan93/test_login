import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../../../../src/app/shared/auth.guard';
import { MatHangComponent } from './mathang/mathang.component';
const routes: Routes = [
  {
    path: '',
    redirectTo: 'danhmuc',
    pathMatch: 'full',
  },
  {
    path: 'mathang',
    component: MatHangComponent,
    data: {
      title: 'Mặt hàng',
      //requiredPolicy: 'Permissions.Posts.View',
    },
    //canActivate: [AuthGuard],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class DanhMucRoutingModule {}
