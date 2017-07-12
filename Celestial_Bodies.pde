public class Planet extends CelestialBody
{ 
  // constructor
  Planet(float orbitRadius, float orbitVel, float radius, color surfaceColor, float initAngle)
  {
    this.orbitRadius = orbitRadius;
    this.orbitVel = orbitVel;
    this.angle = initAngle;
    this.radius = radius;
    this.surfaceColor = surfaceColor;
  }
  
  public void display()
  {
    pushMatrix();
    super.dispOrbit();
    super.display();
    popMatrix();
    updateAngle();
  }
}

public class Moon extends CelestialBody
{
  // attributes
  private Planet planet;
  
  // constructor
  Moon(float orbitRadius, float orbitVel, float radius, color surfaceColor, float initAngle, Planet planet)
  {
    this.orbitRadius = orbitRadius;
    this.orbitVel = orbitVel;
    this.angle = initAngle;
    this.radius = radius;
    this.surfaceColor = surfaceColor;
    this.planet = planet;
  }
  
  public void display()
  {
    pushMatrix();
    rotateY(planet.angle);
    translate(planet.orbitRadius, 0, 0);
    super.dispOrbit();
    super.display();
    translate(-planet.orbitRadius, 0, 0);
    rotateY(-planet.angle);
    popMatrix();
    updateAngle();
  }
  
}

private abstract class CelestialBody
{
  // attributes
  protected float orbitRadius, orbitVel;
  protected float angle;
  protected float radius;
  protected color surfaceColor;
  
  protected void display()
  {
    rotateY(angle);
    translate(orbitRadius, 0, 0);
    fill(surfaceColor);
    sphere(radius);
    translate(-orbitRadius, 0, 0);
    rotateY(-angle);
  }
  
  protected void dispOrbit()
  {
    noFill();
    stroke(surfaceColor);
    rotateX(PI/2.0);
    ellipse(0, 0, orbitRadius, orbitRadius);
    rotateX(-PI/2.0);
    noStroke();
  }
  
  protected void updateAngle()
  {
    angle += orbitVel;
  }
}