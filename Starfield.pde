Particle[] particles;

void setup(){
	size(1000, 750);
  particles = new Particle[1000];
  
  int red = (int)(Math.random() * 256);
  int green = (int)(Math.random() * 256);
  int blue = (int)(Math.random() * 256);
  
  for(int i = 0; i < particles.length; i++){
    particles[i] = new NormalParticle(red, green, blue);
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
  
  NormalParticle(int red, int green, int blue){
    myX = 500;
    myY = 100;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10 + 5;
    fill(red, green, blue);
  }
  
  public void walk(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    
    // Gravity
    if(myAngle > 7 * Math.PI / 6 && myAngle < 11 * Math.PI / 6){
      if(myX > 450 && myX < 550){
        myY = myY - Math.random() * 3;
      } else {
        myY = myY + Math.random() * 10;
      }
    } else {
      myY = myY + Math.random() * 10;
    }
  }
  
  public void show(){
    ellipse((float)myX, (float)myY, 10, 10);
  }
	
}

interface Particle {
	public void walk();
  public void show();
}

//class OddballParticle implements Particle
{
	//your code here
}

class JumboParticle //uses inheritance
{
	//your code here
}
