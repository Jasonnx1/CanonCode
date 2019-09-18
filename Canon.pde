class Canon
{
 
  Base canonBase;
  Head canonHead;
  
  
  Canon(Base tempBase, Head tempHead)
  {
    
    canonBase = tempBase;
    canonHead = tempHead;
    
  }
  
  
  void update(float deltaTime)
  {
   
    
   
    
    canonBase.update(deltaTime);
    canonHead.update(deltaTime);
    
    
    
  }
  
 
  
  void display()
  {
    
    canonHead.display();
    canonBase.display();
    
    
    
    
    
    
    
  }
  
  
}
