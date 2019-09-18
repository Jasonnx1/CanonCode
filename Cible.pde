class Cible {

  // location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Cercle box;
  
  boolean touche;
  
  // Mass is tied to size
  float mass;

  Cible(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    touche = false;
    box = new Cercle( (mass - mass / 4 )/2, location.x, location.y);
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }
  
  boolean isTouched()
  {
    
    return touche;
    
  }

  void update() {
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
    
    box.position = location;
  }
  
  // Draw Mover
  void display() {
    stroke(0);
    strokeWeight(5);
    fill(200, 50, 50);
    ellipse(location.x, location.y, mass - mass/4, mass - mass / 4);
    box.display();
  }
  
  // Bounce off bottom of window
  void checkEdges() {
    
    if (location.y + ((mass - mass/4)/2 ) > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      location.y = height - ((mass - mass/4) /2 );
    }
    
    if (location.x + ((mass - mass/4)/2 ) > width) {
      velocity.x *= -0.9;  // A little dampening when hitting the bottom
      location.x = width - ((mass - mass/4) /2 );
    }
    
     if (location.x - ((mass - mass/4)/2 ) < 0) {
      velocity.x *= -0.9;  // A little dampening when hitting the bottom
      location.x = ((mass - mass/4) /2 );
    }
    
    
    
  }
}
