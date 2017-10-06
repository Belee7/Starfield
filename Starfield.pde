Particle[] aBunch;
void setup()
{
  size(500, 500);

  aBunch = new Particle[120];
  aBunch [0] = new OddballParticle();
  aBunch [1] = new JumboParticle();
  aBunch [2] = new JumboParticle();
  aBunch [3] = new JumboParticle();
  for (int i = 4; i < aBunch.length; i++)
  {
    aBunch[i] = new NormalParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < aBunch.length; i++)
  {
    aBunch [i].move();
    aBunch [i].show();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, mySpeed, myAngle, myOpac, mySize;
  int myColor;
  NormalParticle()
  {
    mySpeed = (Math.random() ) + 0.5;
    myAngle = (Math.random()*(2 * Math.PI));
    myX = 250;
    myY = 250;
    myColor = 255;
  }

  public void move()
  {
    myX = (Math.cos(myAngle) * mySpeed) + myX;
    myY = (Math.sin(myAngle) * mySpeed) + myY;
    if (myX > 500 || myX < 0 || myY > 500 || myY < 0)
    {
      myX = myY = 250;
      myOpac = 0;
      mySize = 5;
    }
    myOpac = dist(250, 250, (float)myX, (float)myY);
    mySize = (dist(250, 250, (float)myX, (float)myY)) / 100;
  }
  public void show()
  {
    noStroke();
    fill(myColor, myColor, myColor, (int)myOpac +  5);
    ellipse((float)myX, (float)myY, (float) mySize, (float)mySize);
  }
}


interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  double myX, myY;

  OddballParticle()
  {

    myX = 250;
    myY = 250;
  }
  public void show()
  {
    fill(255);
    ellipse((float) myX, (float) myY, 20, 20);
  }
  public void move()
  {
    myX = myX + 3.6;
    myY = myX + 3.6;
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill (myColor, myColor, myColor, ((float)myOpac - 20));
    ellipse((float)myX, (float)myY, ((float) mySize) + 6, ((float)mySize) + 6);
  }
}
