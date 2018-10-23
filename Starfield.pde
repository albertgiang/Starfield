int loopTracker = 0;
Particle[] particles;

void setup(){
  size(1000, 750);
  background(0);
  particles = new Particle[1000];
  
  int red = (int)(Math.random() * 256);
  int green = (int)(Math.random() * 256);
  int blue = (int)(Math.random() * 256);
  
  for(int i = 0; i < particles.length; i++){
    particles[i] = new NormalParticle(red, green, blue);
  }
  
  int oddRed = (int)(Math.random() * 256);
  int oddGreen = (int)(Math.random() * 256);
  int oddBlue = (int)(Math.random() * 256);
  
  System.out.println(red);
  System.out.println(green);
  System.out.println(blue);
   System.out.println();
  System.out.println(oddRed);
  System.out.println(oddGreen);
  System.out.println(oddBlue);
  
  particles[0] = new OddballParticle(oddRed, oddGreen, oddBlue);
  particles[1] = new JumboParticle(red, green, blue);
}

void draw(){
   for(int i = 0; i < particles.length; i++){
     particles[i].show();
     particles[i].walk();
    }
    
    loopTracker++;
    
  if(loopTracker == 15){
      background(0);
      loopTracker = 0;
    }
}

class NormalParticle implements Particle {
  
  double myX, myY, myAngle, mySpeed;
  int myColor;
  
  NormalParticle(int red, int green, int blue){
    myX = 500;
    myY = 100;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10 + 5;
    myColor = color(red, green, blue);
  }
  
  NormalParticle(){
  }
  
  void walk(){
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
  
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
  
}

interface Particle {
  public void walk();
  public void show();
}

class OddballParticle implements Particle{
  
  double myX, myY, myAngle, mySpeed;
  int myColor;
  
  OddballParticle(int oddRed, int oddGreen, int oddBlue){
    myX = 500;
    myY = 100;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 1;
    myColor = color(oddRed, oddGreen, oddBlue);
  }
  
  void walk(){
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
  
  void show(){
    fill(myColor);
    rect((float)myX, (float)myY, 25, 25);
  }
}

class JumboParticle extends NormalParticle{
  
  JumboParticle(int red, int green, int blue){
    myX = 500;
    myY = 100;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10 + 5;
    myColor = color(red, green, blue);
  }
  
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, 50, 50);
  }
}
