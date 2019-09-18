class Base extends Object
{
  
  int size;
  
  Base()
  {
    size = 50;
    position = new PVector(0, height - size);
    
    
  }
  
  
  void update(float deltaTime)
  {
    
    
  }
  
  
  void display()
  {
    rectMode(CORNER);
   
   fill(70);
   rect(position.x, position.y, size, size);
    
  }
  
}
