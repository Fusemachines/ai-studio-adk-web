import { Component } from "@angular/core";
import { Router } from "@angular/router";

@Component({
  selector: "app-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.scss"],
})
export class LoginComponent {
  constructor(private router: Router) {}

  login() {
    // Set a token in localStorage (or sessionStorage)
    localStorage.setItem("auth_token", "sample_token");
    // Navigate to the layout module
    this.router.navigate(["/"]);
  }
}
