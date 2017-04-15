class PVector
{
    float x,y;
    PVector(float xx,float yy)
    {  
  x=xx;
  y=yy;
    }
    void add(PVector v)
    {
  y+=v.y;
  x+=v.x;
    }

    void sub(PVector v)
    {
  y-=v.y;
  x-=v.x;
    }
    void mult(float n)
    {
  x*=n;
  y*=n;
    }
    void div(float n)
    {
  x/=n;
  y/=n;
    }

    void normalize()
    {
  float m=mag();
  if(m!=0)
      div(m);
    }
    
    float mag()
    {
  return sqrt(x*x+y*y);
    }
}

class Mover
{
    PVector location;
    PVector velocity;

    Mover()
    {
  location = new PVector(random(width),random(height));
  velocity = new PVector(random(-2,2),random(-2,2));
    }
    
    void update()
    {
  location.add(velocity);
    }
    
    void display()
    {
  stroke(0)
  fill(175);
  ellipse(location.x,location.y,16,16);
    }

    void checkEdge()
    {
  if(location.x>width)
      location.x=0;
  else if(location.x<0)
      location.x=width;
  if(location.y>height)
      location.y=0;
  else if(location.y<0)
      location.y=height;
    }
}


Mover mover;

void setup()
{
    size(800,200);
    smooth();
    mover=new Mover;
}
 

void draw()
{
    background(255);

    mover.update();
    mover.checkEdge();
    mover.display();
}