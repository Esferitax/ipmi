PImage img ;
void setup(){
  size(800,400);
  img = loadImage ( "patamon.jpg");
}

void draw(){
  image(img, 0, 0, 400, 400);
  fill(247, 146, 22);
  noStroke();
  circle(600,160,160);
  fill(255, 255, 255);
    circle(610,300,200);
    stroke(0);
                      fill(0, 0, 0);
       ellipse(555,150,50,30);
            ellipse(635,150,50,30);
            fill(59, 218, 234);
    ellipse(555,150,40,30);
     ellipse(635,150,40,30);
   


}
