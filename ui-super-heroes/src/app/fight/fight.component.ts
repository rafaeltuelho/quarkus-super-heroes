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
  avatarShieldBalls: Ball[] = [];
  canvas: HTMLCanvasElement;


  constructor(private fightService: FightService) {
  }

  ngOnInit() {
    this.newFighters();
    this.canvas = document.getElementById('canvas-fight') as HTMLCanvasElement;
    let fightArena = document.getElementById('fight-arena');
    this.canvas.width = fightArena.clientWidth;
    this.canvas.height = fightArena.clientHeight;
    this.createAvatarShieldBalls();
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
    console.debug(this.avatarShieldBalls);
    this.loop();
  }

  loop() {
    this.canvas.getContext("2d").fillStyle = "rgba(246,252,250,0.5)";
    this.canvas.getContext("2d").fillRect(0, 0, this.canvas.width, this.canvas.height);

    for (const ball of this.balls) {
      ball.draw();
      ball.update();
      // ball.collisionDetect(this.avatarShieldBalls);
    }
  
    for (const avatarShieldBall of this.avatarShieldBalls) {
      avatarShieldBall.draw();
      avatarShieldBall.update();
      avatarShieldBall.collisionDetect(this.balls);
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
        'hero',
        this.random(0 + size, this.canvasLeftBoxXZero() - size),
        this.random(0 + size, this.canvas.height - size),
        this.random(1, power.score),
        0,
        'blue',
        size + (size * power.score /10),
        'canvas-fight');
    });

    let villainPowerBalls = this.fighters.villain.powers.map(power => {
      return new Ball(
        'villain',
        this.random(size + this.canvasRightBoxXZero(), this.canvas.width - size),
        this.random(0 + size, this.canvas.height - size), 
        this.random(-1, -power.score),
        0, 
        'red',
        size + (size * power.score /10),
        'canvas-fight');
    });

    return [...villainPowerBalls, ...heroPowerBalls];
  }

  createAvatarShieldBalls() {
    let heroAvatarBall = new Ball(
      'hero',
      this.canvasLeftBoxXZero() / 2,
      this.canvas.height / 2, 
      0,
      0, 
      'rgba(0, 0, 0, 0)',
      150,
      'canvas-fight');
    heroAvatarBall.draw();
    this.avatarShieldBalls.push(heroAvatarBall);

    let villainAvatarBall = new Ball(
    'villain',
    this.canvas.width - (this.canvasRightBoxXZero() / 4),
    this.canvas.height / 2, 
    0,
    0, 
    'rgba(0, 0, 0, 0)',
    150,
    'canvas-fight');
    villainAvatarBall.draw();

    this.avatarShieldBalls.push(villainAvatarBall);
  }

  canvasRightBoxXZero() {
    return this.canvas.width - (this.canvas.width / 3);
  }

  canvasLeftBoxXZero() {
    return this.canvas.width / 3;
  }
}
