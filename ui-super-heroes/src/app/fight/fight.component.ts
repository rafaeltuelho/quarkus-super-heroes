import { animate, style, transition, trigger } from '@angular/animations';
import { Component, OnInit } from '@angular/core';
import { Fighters, FightService, Hero, Villain } from '../shared';
import { Ball } from '../shared/model/canvasBall';

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

  fighters: Fighters = new Fighters();
  winner: String;
  fighting: boolean;
  firedState: boolean;
  balls: Ball[];
  canvas: HTMLCanvasElement;


  constructor(private fightService: FightService) {
  }

  ngOnInit() {
    this.newFighters();
    this.canvas = document.getElementById('canvas-fight') as HTMLCanvasElement;
    this.drawAvatars();
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
    this.fightService.apiFightsPost(this.fighters).subscribe(
      fight => {
        this.fightService.onNewFight(fight);
        this.winner = fight.winnerName;
      }
    );
    
    this.balls = this.createPowerBalls();
    this.loop();
  }

  loop() {
    this.canvas.getContext("2d").fillStyle = "rgba(0 0 0 / 25%)";
    this.canvas.getContext("2d").fillRect(0, 0, this.canvas.width, this.canvas.height);

    for (const ball of this.balls) {
      ball.draw();
      ball.update();
        // ball.collisionDetect();
    }
  
    window.requestAnimationFrame(this.loop.bind(this));
  }

  newFighters() {
    this.winner = null;
    this.fightService.apiFightsRandomfightersGet().subscribe(fighters => this.fighters = fighters);
    this.fighting = false;
    this.firedState = false;
  }

  random(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  createPowerBalls() {
    const size = 5;
    console.log('canvas.width: ' + this.canvas.width);
    console.log('canvas.height: ' + this.canvas.height);
    let divHero = document.getElementById('hero-container');
    let divVillain = document.getElementById('villain-container');

    let heroPowerBalls = this.fighters.hero.powers.map(power => {
      return new Ball(
        this.random(0 + size, this.canvasLeftBoxWidth() - size),
        this.random(0 + size, this.canvas.height - size),
        0.3,//this.random(7, power.score), 
        0.04,
        'blue',
        size,//power.score, 
        'canvas-fight');
    });

    let villainPowerBalls = this.fighters.villain.powers.map(power => {
      return new Ball(
        this.random(size + this.canvasRightBoxWidth(), this.canvas.width - size),
        this.random(0 + size, this.canvas.height - size), 
        -0.3,//this.random(7, power.score),
        0.04, 
        'red',
        size,//power.score, 
        'canvas-fight');
    });

    return [...villainPowerBalls, ...heroPowerBalls];
  }

  drawAvatars() {
    let heroAvatarBall = new Ball(
      this.canvasLeftBoxWidth() / 2,
      this.canvas.height / 2, 
      0,
      0, 
      'blue',
      25,
      'canvas-fight');
    heroAvatarBall.draw();

    let villainAvatarBall = new Ball(  
    this.canvas.width - (this.canvasRightBoxWidth() / 4),
    this.canvas.height / 2, 
    0,
    0, 
    'red',
    50,
    'canvas-fight');
    villainAvatarBall.draw();
  }

  canvasRightBoxWidth() {
    return this.canvas.width - (this.canvas.width / 3);
  }

  canvasLeftBoxWidth() {
    return this.canvas.width / 3;
  }
}
