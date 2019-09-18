int previousTime;
int deltaTime;
int currentTime;


PVector windR;
PVector windL;

Liquid liquid;

Base base;
Head head;
Cible[] cibles = new Cible[20];

Canon canon;

void setup()
{
  size(640, 480);
  smooth();
  
  windR = new PVector(0.1, 0);
  windL = new PVector(-0.1,0);


  currentTime = millis();
  previousTime = millis();
  
  base = new Base();
  head = new Head();
  
  canon = new Canon(base, head);
  

  reset();
}


void draw()
{
  
  
  
  
  currentTime = millis();
  deltaTime = currentTime - previousTime;
 
  update(deltaTime);
  display();
  
  previousTime = currentTime;
}

void update(int deltatime)
{
  
  
  canon.update(deltaTime);
  
  
}

void display()

{
   
   stroke(0);
   strokeWeight(2);
  canon.display();
  
 
    liquid.display();
  
  
  for (int i = 0; i < cibles.length; i++) {
    
    
    if (liquid.contains(cibles[i])) {      
      PVector dragForce = liquid.drag(cibles[i]);      
      cibles[i].applyForce(dragForce);
    }
    else
    {
      
      
        if(mouseButton == LEFT)
        {
          cibles[i].applyForce(windR);       
        }
        
        if(mouseButton == RIGHT)
        {
          cibles[i].applyForce(windL);       
        }
        
      
     
      
    }
    

    PVector gravity = new PVector(0, 0.1*cibles[i].mass);
    
    if(cibles[i].isTouched() )
    {
      cibles[i].applyForce(gravity);
    }
    
    
    
   
  
    cibles[i].update();
    cibles[i].display();
    cibles[i].checkEdges();
    
    canon.canonHead.checkCollide( cibles[i] );
    
    
  }
  
   PVector gravity = new PVector(0, 0.1*40);
  
      for(int i = 0; i < canon.canonHead.bulletList.size(); i++)
    {
      
      canon.canonHead.bulletList.get(i).applyForce(gravity);
      
      if (liquid.containsB(canon.canonHead.bulletList.get(i) ) ) {      
      PVector dragForce = liquid.dragB( canon.canonHead.bulletList.get(i) );      
      canon.canonHead.bulletList.get(i).applyForce(dragForce);
    
      }
      else
      {
        
        if(mouseButton == LEFT)
        {
          canon.canonHead.bulletList.get(i).applyForce(windR);       
        }
        
        if(mouseButton == RIGHT)
        {
          canon.canonHead.bulletList.get(i).applyForce(windL);       
        }
        
        
      }
      
    }
  
}


void keyReleased()
{
  
  switch(key)
  {
    case 'r':  reset();
    break;
    case 'v': 
    
    if(liquid.presence)
    {
      liquid.presence = false;
    }
    else
    {
      liquid.presence = true;     
    }    
    break;
    
    case ' ': canon.canonHead.shoot();
    break;
    
  }
  
  
  
  
}

void reset() {
  for (int i = 0; i < cibles.length; i++) {
    cibles[i] = new Cible(random(20, 50), random(width - width/4, width), random(0, height - height/4));
  }
  
    liquid = new Liquid(width - width/4, height/2 + height/4, width/4, height/4, random(1.5, 3) );
    canon.canonHead.bulletList = new ArrayList<Boulet>();
}
