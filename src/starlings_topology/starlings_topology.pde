int initBoidNum = 200; //amount of boids to start the program with
BoidList flock1;
float ali,sep,coh;//,flock2,flock3;
float zoom=-1000;
boolean smoothEdges = false,avoidWalls = true;
PFont myFont;
import java.util.Collections;

void settings() {
  size(displayWidth,displayHeight,P3D);  
  if(smoothEdges)
    smooth();
  else
    noSmooth();
}

void setup()
{

  //create and fill the list of boids
  flock1 = new BoidList(initBoidNum,255);
  ali=1;
  coh=3;
  sep=3;
  myFont = createFont("Georgia", 32);textFont(myFont);
  //flock2 = new BoidList(100,255);
  //flock3 = new BoidList(100,128);
}

void draw()
{
  //clear screen
  beginCamera();
  camera();
  //rotateX(map(mouseY,0,height,0,TWO_PI));
  //rotateY(map(mouseX,width,0,0,TWO_PI));
  translate(0,0,zoom);
  endCamera();
  background(#A5CAED);
  directionalLight(255,255,255, 0, 1, -100); 
  noFill();
  stroke(0);
  fill(255);
  text("Birds",-700,height+280);
  text("alignment",-700,height+320);
  text("cohesion",-700,height+360);
  text("seperation",-700,height+400);
  text(flock1.boids.size(),-400,height+280);
  text(ali,-400,height+320);
  text(coh,-400,height+360);
  text(sep,-400,height+400);
  //line(0,0,300,  0,height,300);
  //line(0,0,900,  0,height,900);
  //line(0,0,300,  width,0,300);
  //line(0,0,900,  width,0,900);
  
  //line(width,0,300,  width,height,300);
  //line(width,0,900,  width,height,900);
  //line(0,height,300,  width,height,300);
  //line(0,height,900,  width,height,900);
  
  //line(0,0,300,  0,0,900);
  //line(0,height,300,  0,height,900);
  //line(width,0,300,  width,0,900);
  //line(width,height,300,  width,height,900);
  
  flock1.run(avoidWalls,ali,coh,sep);
  //flock2.run();
  //flock3.run();
}

void keyPressed()
{
  switch (keyCode)
  {
    case UP: zoom-=10; break;
    case DOWN: zoom+=10; break;
  }
  switch (key)
  {
    case 's': flock1.addBoid(new Boid(new PVector(mouseX,mouseY,600),new PVector (random(-1, 1), random(-1, 1), random(1, -1)))); break;
    case 'a': avoidWalls = !avoidWalls; break;
    case 'q': ali++;break;
    case 'w': ali--;break;
    case 'e': coh++;break;
    case 'r': coh--;break;
    case 't': sep++;break;
    case 'y': sep--;break;
    case DELETE: flock1.remove();break;
  }
}

void mousePressed()
{
  if(mouseButton==LEFT)
  flock1.addBoid(new Boid(new PVector(mouseX,mouseY,600),new PVector (random(-1, 1), random(-1, 1), random(1, -1))));
  else
  flock1.addObs(mouseX,mouseY,random(300,900));
}
