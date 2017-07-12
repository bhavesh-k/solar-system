// celestial body params
float mercuryAngle = 0.8;
float mercuryVelocity = 1.0/88;
float venusAngle = 1.1;
float venusVelocity = 1.0/225;
float earthAngle = 0.0;
float earthVelocity = 1.0/365;
float moonAngle = 0.0;
float moonVelocity = 1.0/28;
float marsAngle = 1.7;
float marsVelocity = 1.0/687;
float phobosAngle = 0.0;
float phobosVelocity = 3.0;
float deimosAngle = 0.5;
float deimosVelocity = 1.0/1.26;

// celestial bodies
Planet sun = new Planet(0, 0, 100, color(255,255,255), 0.0);
Planet mercury = new Planet(150, mercuryVelocity, 3, color(100,100,50), mercuryAngle);
Planet venus = new Planet(250, venusVelocity, 4, color(200,200,100), venusAngle);
Planet earth = new Planet(400, earthVelocity, 5, color(0,100,255), earthAngle);
Moon moon = new Moon(10, moonVelocity, 2, color(255), moonAngle, earth);
Planet mars = new Planet(500, marsVelocity, 4, color(255,50,0), marsAngle);
Moon phobos = new Moon(7, phobosVelocity, 1.5, color(50), phobosAngle, mars);
Moon deimos = new Moon(9, deimosVelocity, 1.9, color(200,200,150), deimosAngle, mars);

// user controlled
float earthZoomFactor = 1.0;
float camAngleX  = 0.0;
float camAngleY = 0.0;

void setup()
{
  size(1600,900, P3D);
  frameRate(60);
  ellipseMode(RADIUS); // for the orbits
}

void draw()
{
  // space is black
  background(0);
  
  // smooth bodies
  noStroke();
  
  // earth focused camera
  camera(400*cos(earth.angle)+earthZoomFactor*100*cos(earth.angle-camAngleX), earthZoomFactor*100*sin(-camAngleY), -400*sin(earth.angle)-earthZoomFactor*100*sin(earth.angle-camAngleX),
        400*cos(earth.angle), 0, -400*sin(earth.angle),
        0, 1, 0);
        
  // overview camera
  //camera(0, 0, 1000,
  //      0, 0, 0,
  //      0, 1, 0);
  
  // Sun
  sun.display();
  pointLight(255,255,255,0,0,0);
  
  // Mercury
  mercury.display();
  
  // Venus
  venus.display();
  
  // Earth
  earth.display();
  moon.display();
  //earth.dispOrbit();
  //moon.dispOrbit();
  
  // Mars
  mars.display();
  phobos.display();
  deimos.display();
}

void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  if(e != 0.0)
  {
    earthZoomFactor += e/10.0;
    if(earthZoomFactor < 1.0)
    {
      earthZoomFactor = 1.0;
    }
    else if(earthZoomFactor > 5.0)
    {
      earthZoomFactor = 5.0;
    }
  }
}

void mouseDragged()
{
  if(mouseX > pmouseX) {camAngleX += 0.05;}
  else if(mouseX < pmouseX) {camAngleX -= 0.05;}
  
  if(mouseY > pmouseY)
  {
    camAngleY += 0.05;
    if(camAngleY > (PI/2.0)) {camAngleY = (PI/2.0);}
  }
  else if (mouseY < pmouseY)
  {
    camAngleY -= 0.05;
    if(camAngleY < (-PI/2.0)) {camAngleY = (-PI/2.0);}
  }
}