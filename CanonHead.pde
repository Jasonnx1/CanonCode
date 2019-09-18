class Head
{
  
  int headLength;
  int headWidth;
  float angle;
  float power;
  ArrayList<Boulet> bulletList;
  
  Head()
  {
    
  headLength = 20;
  headWidth = 100;
  angle = 2*PI;
  power = 16;
    
  }
  
  
  
  void update(float deltaTime)
  {
    
    
    for(int i = 0; i < bulletList.size(); i++)
    {
      
     bulletList.get(i).update(deltaTime);
      
    }
    
    
    if(keyPressed)
    {
    
      switch(key)
      {
        case 'd': angle += PI/180;        
                  if( angle > 2*PI ) //#####  Rotate Canon downwards  ######//
                  {          
                    angle = 2*PI;
                  }               
        break;
        
        case 'a': angle -= PI/180;
        
                  if(angle < PI + HALF_PI )  //#####  Rotate Canon upward  s######//
                  {          
                    angle = PI + HALF_PI;
                  }              
        break;

        
       
      }           
    }    
  }
  

  
  void checkCollide(Cible c)
  {    
    for(int i = 0; i < bulletList.size(); i++)
    {     
      bulletList.get(i).Collision(c);     // checks collision between itself and a "Cible"
    }       
  }
  
  void display()
  {
    background(255);
    rectMode(CENTER);
  
    for(int i = 0; i < bulletList.size(); i++)
    {      
     bulletList.get(i).display();      
    }
       
    pushMatrix();    
      translate(30, height - 30);   
      rotate( angle );
      fill(0);
      rect(0,0, headWidth, headLength); 
    popMatrix();   
  }
  
  void shoot()
  {   
     bulletList.add( new Boulet(  (power * cos( angle ) ) , (power * sin( angle ) ) , 30 , (height - 30) ) );   
  }
 
}
