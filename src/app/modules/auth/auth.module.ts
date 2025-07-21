import { NgModule } from "@angular/core";
import { AuthRoutingModule } from "./auth-routing.module";
import { AuthComponent } from "./auth.component";
import { RouterModule } from "@angular/router";
import { LoginComponent } from "./components/login/login.component";
import { CommonModule } from "@angular/common";

@NgModule({
  declarations: [AuthComponent],
  imports: [AuthRoutingModule, CommonModule],
})
export class AuthModule {}
