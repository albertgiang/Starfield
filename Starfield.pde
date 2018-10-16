Particle[] particles;

void setup(){
	size(500, 500);
  particles = new Particle[100];
  
  for(int i = 0; i < particles.length; i++){
    particles[i] = new NormalParticle();
  }
}

void draw(){
	background(0);
  
  for(int i = 0; i < particles.length; i++){
    particles[i].show();
    particles[i].walk();
  }
}

class NormalParticle implements Particle {
  
  double myX, myY, myAngle, mySpeed;
  
  NormalParticle(){
    myX = 250;
    myY = 250;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
  }
  
  public void walk(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
  
  public void show(){
    ellipse((float)myX, (float)myY, 10, 10);
  }
	
}

interface Particle {
	public void walk();
  public void show();
}

class OddballParticle //uses an interface
{
	//your code here
}

class JumboParticle //uses inheritance
{
	//your code here
}
