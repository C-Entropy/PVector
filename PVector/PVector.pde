static class myPVector
{
    float x, y, t_x, t_y;

    myPVector(float xx,float yy)
    {  
  x = xx;
  y = yy;
    }
    
    void add(myPVector v)
    {
  y+=v.y;
  x+=v.x;
    }

    void sub(myPVector v)
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
  if(m!=0) div(m);
    }
    
    float mag()
    {
  return sqrt(x*x+y*y);
    }
    
    void limit(float max)
    {
  if(mag() > max)
  {
      normalize();
      mult(max);
  }
    }

        // static
    static myPVector add(myPVector v, myPVector v1)
    {
  myPVector v2 = new myPVector(v.x + v1.x, v.y + v1.y);
  return v2;
    }
    
    static myPVector sub(myPVector v, myPVector v1)
    {
  myPVector v2 = new myPVector(v.x - v1.x, v.y - v1.y);
  return v2;
    }
    
    static myPVector mult(myPVector v, float n)
    {
  myPVector v1 = new myPVector(v.x*=n, v.y*=n);
  return v1;
    }

    static myPVector div(myPVector v, float n)
    {
  myPVector v1 =  new myPVector(v.x/=n, v.y/=n);
  return v1;
    }
    //static

}

class Mover
{

    myPVector location;
    myPVector velocity;
    myPVector acceleration;
    float topspeed;
    int color_a, color_b, color_c, translate;    
    Mover()
    {
  location = new myPVector(random(width), random(height));
  acceleration = new myPVector(0, 0);
  velocity = new myPVector(0,0);
  topspeed = 4;
  color_a = (int)random(0, 255);
  color_b = (int)random(0, 255);
  color_c = (int)random(0, 255);
  translate = (int)random(0, 100);
    }
    
    void update()
    {
  velocity.add(acceleration);
  velocity.limit(topspeed);
  location.add(velocity);
  acceleration.mult(0);  
    }
    
    void myApplyForce(myPVector force)
    {
  acceleration.add(force);
    }
    
    void checkEdge()
    {
    if(location.x>width) location.x = 2*width - location.x;
      else if(location.x<0) location.x*=-1;

  if(location.y>height) location.y = 2*height - location.y;
  else if(location.y<0) location.y*=-1;
    }
    
    void display()
    {
  stroke(0);
  fill(color_a, color_b, color_c, translate);
  ellipse(location.x,location.y,16,16);
    }

}

Mover mover;
myPVector wind;
float t;
void setup()
{
    background(225);
    size(200,200);
    smooth();
    mover = new Mover();
    wind = new myPVector(0.1, 0.2);
    t = 100;
}

 

void draw()
{
    t += 0.1;
    wind.normalize();
    wind.mult(-1*map(noise(t), 0, 1, 0, 0.5));
    mover.myApplyForce(wind);
    mover.update();
    mover.checkEdge();
    mover.display();
}
 