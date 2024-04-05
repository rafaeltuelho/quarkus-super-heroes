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

  constructor(
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

  // collisionDetect() {
  //   for (const ball of balls) {
  //     // if (!(this === ball)) {
  //       const dx = this.x - ball.x;
  //       const dy = this.y - ball.y;
  //       const distance = Math.sqrt(dx * dx + dy * dy);

  //       if (distance < this.size + ball.size) {
  //         ball.color = this.color = randomRGB();
  //       }
  //     // }
  //   }
  // }

  // collision({ obj }) {
  //   return (
  //     box1.position.x + box1.width >= box2.position.x && // box1 right collides with box2 left
  //     box2.position.x + box2.width >= box1.position.x && // box2 right collides with box1 left
  //     box1.position.y + box1.height >= box2.position.y && // box1 bottom collides with box2 top
  //     box2.position.y + box2.height >= box1.position.y // box1 top collides with box2 bottom
  //   )
  // }
}