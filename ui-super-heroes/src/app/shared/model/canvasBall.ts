export class Ball {

  private canvas: HTMLCanvasElement;
  private context: CanvasRenderingContext2D;
  private width: number;
  private height: number;
  public x: number;
  public y: number; 
  public velX: number; 
  public color: string;
  public velY: number; 
  public size: number;
  public type: 'hero' | 'villain' | 'avatar';

  constructor(
    type: 'hero' | 'villain' | 'avatar',
    x: number, 
    y: number, 
    velX: number, 
    velY: number, 
    color: string,
    size: number,
    canvasContainerId: string) { 

    this.canvas = document.getElementById(canvasContainerId) as HTMLCanvasElement;
    this.context = this.canvas.getContext('2d');
    this.width = this.canvas.width;
    this.height = this.canvas.height;
    this.x = x;
    this.y = y;
    this.velX = velX;
    this.velY = velY;
    this.color = color;
    this.size = size;
    this.type = type;
  }

  degToRad(degrees) {
    return degrees * Math.PI / 180;
  };

  draw() {
    this.context.beginPath();
    this.context.fillStyle = this.color;
    // this.context.arc(this.x, this.y, this.size, 0, 2 * Math.PI);
    this.context.arc(this.x, this.y, this.size, this.degToRad(0), this.degToRad(360), false);
    this.context.fill();
  }

  update() {
    // if (this.x + this.size >= this.width) {
    //   this.velX = -Math.abs(this.velX);
    // }

    // if (this.x - this.size <= 0) {
    //   this.velX = Math.abs(this.velX);
    // }

    // if (this.y + this.size >= this.height) {
    //   this.velY = -Math.abs(this.velY);
    // }

    // if (this.y - this.size <= 0) {
    //   this.velY = Math.abs(this.velY);
    // }

    this.x += this.velX;
    this.y += this.velY;
  }

  random(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
  // function to generate random RGB color value
  randomRGB() {
    return `rgba(${this.random(0, 255)},${this.random(0, 1)},${this.random(0, 1)},${this.random(0, 1)})`;
    // return `rgba(255,0,0,0.070)`;
  }

  collisionDetect(targetBalls: Ball[]) {
    // console.debug(targetBalls);
    for (const targetBall of targetBalls) {
      if (!(this.type === targetBall.type)) {
        // console.log('collisionDetect[  power ball: ' + this.type + ' - targetBall: ' + targetBall.type + ' ]');
        const dx = this.x - targetBall.x;
        const dy = this.y - targetBall.y;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < this.size + targetBall.size) {
          this.color = targetBall.color = this.randomRGB();//'rgba(235, 235, 235, 0.8)';
          this.size += targetBall.size/1000;
          targetBall.size = 0;
        }
      }
    }
  }
}