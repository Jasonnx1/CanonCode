class Cercle
{
  
  PVector position;
  float rayon;
  
  
  
  
  Cercle(float tempRayon, float x, float y)
  {
    position = new PVector(x, y);
    rayon = tempRayon;
  }
  
  
  void display()
  {
    
    fill(0,0,255, 100);
    ellipse(position.x, position.y, rayon*2, rayon*2);
    
  }
 
  
  
  
  
  
}
