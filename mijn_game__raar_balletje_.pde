float xPos, yPos;
float xSnelheid=1, ySnelheid=1;                  
int xKant=1, yKant=1;                   
int score=0;                  
int lives=3;  
boolean lost=false;    
int Highscore = 0;

void setup()                  
{
  size (400, 400);
  xPos=width/2;
  yPos = height/2;
  fill(0, 255, 0);              
  textSize(13);
}

void draw() {                                   
  background (0);    
  if (lives > 0) {
    ellipse(xPos, yPos, 40, 40);               
    xPos=xPos+(xSnelheid*xKant); 
    yPos+=(ySnelheid*yKant);
    if (xPos > width-20 || xPos<20)              
    {
      xKant=-xKant;
    }
    if (yPos > width-20 || yPos<20)              
    {
      yKant=-yKant;
    }
    textSize(13);
    text("Score = "+score, 10, 10);                  
    text("Levens = "+lives, width-80, 10);
  }
  if (lives<=0)                                 
  {
    textSize(20);
    text("Klik om te restarten", 100, 100);   
    text("Highscore: " + Highscore, 125, 300);
    lost=true;
    if(Highscore < score){
      Highscore = score;
    }
    textSize(20);
    text("Je had " + score + " punten", 120, 275);
    textSize(10);
  }
  println(xSnelheid, ySnelheid);
}
void mousePressed() {                            
  if (dist(mouseX, mouseY, xPos, yPos)<=20)      
  {
    score+=1;                        
    xSnelheid+=random(1);
    ySnelheid+=random(1);
  } else                                         
  {
    if (xSnelheid<1)                                
    {
      xSnelheid=xSnelheid-1;
    }
    if (ySnelheid<1)                                
    {
      ySnelheid=ySnelheid-1;
    }
    lives=lives-1;
  }
  if (lost==true)                              
  {
    xSnelheid=1; 
    ySnelheid=1;
    lives=3;
    score=0;
    xPos=width/2;
    yPos=height/2;
    xKant=1;
    yKant=1;
    lost=false;
  }
}
