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

    float mag()
    {
	return sqrt(x*x+y*y);
    }
}


PVector location;
PVector velocity;


void setup()
{
    size(800,200);
    smooth();
}
 

void draw()
{
    background(255);

    PVector mouse = new PVector(mouseX,mouseY);
    PVector center = new PVector(width/2,height/2);
    mouse.sub(center);

    float m=mouse.mag();
    fill(0);
    rect(0,0,m,10);

    translate(width/2,height/2);
    line(0,0,mouse.x,mouse.y);


/*    location.add(velocity);
    if(location.x>width||location.x<0)
	velocity.x*=-1;
    if(location.y>height||location.y<0)
	velocity.y*=-1;
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);*/
}
