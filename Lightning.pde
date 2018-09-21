int index = 0;
ArrayList<lightning> larray = new ArrayList<lightning>(); 
ArrayList<spaceship> sarray = new ArrayList<spaceship>();
void setup(){
frameRate(210);
size(1080,720);
larray.add(new lightning());
sarray.add(new spaceship());
sarray.add(new spaceship());
sarray.add(new spaceship());
sarray.add(new spaceship());
sarray.add(new spaceship());
sarray.add(new spaceship());
sarray.add(new spaceship());
sarray.add(new spaceship());
background(0);
}
void draw(){
  background(0);
stroke(0);
fill(127);
ellipse(540,360,510,510);
noFill();
stroke(0);
arc(540,360,510,50,PI,TWO_PI);
arc(540,300,500,50,PI,TWO_PI);
arc(540,240,510,70,PI,TWO_PI);
arc(540,190,400,90,PI,TWO_PI);
arc(540,420,500,50,PI,TWO_PI);
arc(540,480,510,70,PI,TWO_PI);
arc(540,540,400,60,PI,TWO_PI);
arc(540,600,400,60,PI,TWO_PI);
arc(540,360,500,1000,0,TWO_PI);
arc(540,360,500,900,0,TWO_PI);
arc(540,360,500,800,0,TWO_PI);
arc(540,360,300,700,0,TWO_PI);
arc(540,360,100,600,0,TWO_PI);
fill(127);
stroke(0);
ellipse(540,360,125,125);
stroke(255,0,0);
fill(255,0,0);
ellipse(540,360,5,5);
for(lightning lightning : larray){
  sarray.get(index).takedamage();
lightning.trackspaceship(sarray.get(index).sx + 20, sarray.get(index).sy + 5);
}
for(spaceship spaceship : sarray){
spaceship.movespaceship();
spaceship.createspaceship();
}
}
class lightning{
int lx1 = 540;
int ly1 = 360;
int lx2;
int ly2;
int mx;
int my;
boolean running = true;
  lightning(){
  }
void trackspaceship(int sx,int sy){
running = true;
while(running){
int xd = lx1 - sx;
int yd = ly1 - sy;
double distance = xd * xd + yd * yd;
distance = Math.sqrt(distance);
double time = -distance/15;
double xv = xd/time;
double yv = yd/time;
lx2 = lx1 + (int)(Math.random()*xv -1/2*xv);
ly2 = ly1 + (int)(Math.random()*yv-1/2*xv);
stroke(255,0,0);
line(lx1,ly1,lx2,ly2);
if(lx2 >= sx - 5 && ly2 >= sy - 5 && lx2 <= sx + 5 && ly2 <= sy + 5){
lx2 = 540;
ly2 = 360;
mx = sx;
my = sy;
running = false;
}
lx1 = lx2;
ly1 = ly2;
  }
}
}
class spaceship{
  int maxhealth;
int sx;
int sy;
boolean direction;
int health;
spaceship(){
sx = (int)(Math.random()*2)*1050 + 10;
sy = (int)(Math.random()*700) + 20;
health = (int)(Math.random()*100) + 250;
maxhealth = health;
if(Math.random()<.5){
direction = true;
} else{
direction = false;
}
}
void movespaceship(){
if(direction){
sx = sx + 1;
if(sx + 1 > 1050){
direction = false;
}
} else{
sx = sx - 1;
if(sx - 1 < 10){
direction = true;
}
}
}
void createspaceship(){
stroke(0);
fill(200);
rect(sx,sy,30,10);
float hwidth = (health * 28)/maxhealth;
noStroke();
fill(255);
rect(sx + 2, sy + 14, 28,4);
fill(255,0,0);
rect(sx + 2, sy + 14, hwidth,4);
}
void takedamage(){
health = health - 1;
if(health <= 0){
sx = (int)(Math.random()*2)*1050 + 10;
sy = (int)(Math.random()*700) + 20;
health = (int)(Math.random()*100) + 250;
maxhealth = health;
index = index + 1;
if(index > 7){
index = 0;
}
}
}
}
void mousePressed(){
larray.add(new lightning());
}
