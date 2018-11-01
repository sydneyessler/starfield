Particle[] p=new Particle[100];
int rad=60;

PImage bee;

void setup() {
  size(400, 400);
  frameRate(30);
  ellipseMode(RADIUS);
  bee = loadImage("bee.png");
  bee.resize(100, 100);

  for (int i=0; i<80; i++)
  {
    p[i]=new NormalParticle();
  }
  for (int i=80; i<90; i++)
  {
    p[i]=new OddballParticle();
  }
  for (int i=90; i<p.length; i++)
  {
    p[i]=new JumboParticle();
  }
}
void draw() {
  //background(0);
  fill(0,0,0,20);
  rect(0,0,width,height);
  for (int i=0; i<p.length; i++) {
    p[i].move();
    p[i].show();
  }
}
class NormalParticle implements Particle {
  //your code here
  double x, y, speed, angle;

  NormalParticle() {
    x= width/2;
    y= width/2;
    speed=Math.random()*4;
    angle=(Math.random())*Math.PI*2;
  }

  void move() {
    x+=Math.cos(angle)*speed;
    y+=Math.sin(angle)*speed;
    angle+=.03;
  }

  void show() {
    fill(255);
    noStroke();
    ellipse((int)x, (int)y, 5, 5);
  }
}
interface Particle {
  public void show();
  public void move();
}
class OddballParticle implements Particle//uses an interface
{
  double x, y, speed, angle;
  float xspeed=2.8;
  float yspeed=2.2;
  int xdirection = 1;  
  int ydirection = 1;
  
  OddballParticle() {
  }
  void show() {
    fill(200, 0, 0);
    image(bee, (int)x, (int)y);
  }
  void move() {
    x = x + ( xspeed * xdirection );
    y = y + ( yspeed * ydirection );
    if (x > width-90 || x < 0) {
      xdirection *= -1;
    }
    if (y > height-90 || y < 0) {
      ydirection *= -1;
    }
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{
  PImage bee;
  void move() {
    x+=Math.cos(angle)*(speed/2);
    y+=Math.sin(angle)*(speed/2);
    angle-=.03;
  }

  void show() {
    fill((int)(Math.random()*100)+100, (int)(Math.random()*100)+100, (int)(Math.random()*100)+100);
    ellipse((int)x, (int)y, 20, 20);
  }
}
