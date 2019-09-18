/**
 * Forces (Gravity and Fluid Resistence) with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of multiple force acting on bodies (Mover class)
 * Bodies experience gravity continuously
 * Bodies experience fluid resistance when in "water"
 */
 
 // Liquid class 
 class Liquid {
   
   boolean presence;

  
  // Liquid is a rectangle
  float x,y,w,h;
  // Coefficient of drag
  float c;

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    presence = true;
  }
  
  // Is the Mover in the Liquid?
  boolean contains(Cible cib) {
    
    if(presence)
    {
      PVector l = cib.location;
      if (l.x > x && l.x < x + w && l.y > y && l.y < y + h) {
        return true;
      }  
      else {
        return false;
      }
    }
    
    return false;
    
  }
  
    boolean containsB(Boulet ball) {
    
    if(presence)
    {
      PVector l = ball.position;
      if (l.x > x && l.x < x + w && l.y > y && l.y < y + h) {
        return true;
      }  
      else {
        return false;
      }
    }
    
    return false;
    
  }
  
  
  // Calculate drag force
  PVector drag(Cible cib) {
    // Magnitude is coefficient * speed squared
    float speed = cib.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = cib.velocity.get();
    dragForce.mult(-1);
    
    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
  
  
    PVector dragB(Boulet b) {
    // Magnitude is coefficient * speed squared
    float speed = b.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = b.velocity.get();
    dragForce.mult(-1);
    
    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
  
  void display() {
    
    if(presence)
    {
      noStroke();
      fill(0,0,255, 50);
      rect(x,y,w,h);
      fill(0);
      text("Jason Gélinas", x + w/2 - 20 , y + (h - h/4) );
      text(c, x + w/2 - 10 , y + h/2);
    }
    
    
  }

}
