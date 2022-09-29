import { animate, style, transition, trigger } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { Fighters, FightService, Hero, Villain } from '../shared';

@Component({
  selector: 'hero-fight',
  templateUrl: './fight.component.html',
  animations: [
    trigger('fire', [
      // state(),
      transition('* => *', [
        style({border: '5px red solid'}),
        animate(5)
      ])
    ])
  ]
})
export class FightComponent implements OnInit {

  figthers: Fighters = new Fighters();
  winner: String;
  fighting: boolean;
  firedState: boolean;

  constructor(private fightService: FightService) {
  }

  ngOnInit() {
    this.newFighters();
  }

  fire() {
    console.log('animating!')
    this.firedState = false;
    setTimeout(() => {
      this.firedState = true;
    }, 1);
  }

  fight() {
    this.fighting = true;
    this.fightService.apiFightsPost(this.figthers).subscribe(
      fight => {
        this.fightService.onNewFight(fight);
        this.winner = fight.winnerName;
      }
    );
  }

  newFighters() {
    this.winner = null;
    this.fightService.apiFightsRandomfightersGet().subscribe(figthers => this.figthers = figthers);
    this.fighting = false;
    this.firedState = false;
  }
}
