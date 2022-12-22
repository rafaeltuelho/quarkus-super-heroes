import { Component } from '@angular/core';
import { interval, Observable } from "rxjs";
import { map, shareReplay } from "rxjs/operators";
import { calcDateDiff } from "./dateDiff";
import { timeComponents } from "./timeComponents";

@Component({
  selector: "timer-app",
  templateUrl: "./app.component.timer.html",
})
export class AppComponentTimer {

  constructor() {
    this.timeLeft$ = interval(1000).pipe(
      map(x => calcDateDiff()),
      shareReplay(1)
    );
  }
 
  public timeLeft$: Observable<timeComponents>;
}