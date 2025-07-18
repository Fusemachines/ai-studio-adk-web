import { Routes } from "@angular/router";
import { EvalTabComponent } from "../components/eval-tab/eval-tab.component";
import { ChatComponent } from "../components/chat/chat.component";

const Routing: Routes = [
  {
    path: "",
    component: ChatComponent,
  },
];

export { Routing };
