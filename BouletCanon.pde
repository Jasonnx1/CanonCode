class Boulet extends Object
{
  
int rayon;
Cercle box;
PVector dir;
float coDrag;



  Boulet(float Dx, float Dy, float Px, float Py )
  {
    dir = new PVector(Dx, Dy);
    
    coDrag = 0.9;
   
   rayon = 10;
   position = new PVector(Px , Py);
   velocity = new PVector(dir.x , dir.y);
   acceleration = new PVector(0,0);
   
   box = new Cercle(rayon, 0, 0); 
    
  }
  
  
  void update(float detlaTime)
  {
   
    if(position.x - rayon < 0 )
    {
      velocity.x *= (coDrag);
      position.x = rayon;
      velocity.x *= -1;
      
    }
    
    if(position.x  + rayon > width)
    {
      velocity.x *= (coDrag);
      position.x = width - rayon;
      velocity.x *= -1;
      
    }
    
    if(position.y - rayon < 0 )
    {
      velocity.y *= (coDrag);
      position.y = rayon;
      velocity.y *= -1;
      
    }
    
    if(position.y  + rayon > height)
    {
      velocity.y *= (coDrag);
      position.y = height - rayon;
      velocity.y *= -1;
      
    }
    
    
    
   // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    position.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
    
  }
  
   void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, 40);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }
  
  void display()
  {
    ellipse(position.x, position.y, rayon * 2, rayon * 2);   
  }
  
  void Collision(Cible ColBox)
  {
    
    if(PVector.dist(position, ColBox.box.position ) < box.rayon + ColBox.box.rayon )
    {
      
      ColBox.touche = true;
      
    }
    
  }
  
  
  
  
  
  
}
