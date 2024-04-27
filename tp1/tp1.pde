PImage img;
void setup() {
  size(800, 400);
  img = loadImage("OIP.jpg"); 
image(img, 100, 200);
img.resize(400, 300);
background(220);

}
void draw() {
  image(img, 0, 50);
  println(mouseX); // imprime en consola el valor del mouse en X
  println(mouseY); // imprime en consola el valor del mouse en Y
   noStroke();
     fill(20);
  circle(700, 360, 210); //Cuerpo
  circle(600, 300, 200);
 stroke(0);
  circle(550, 250, 190); // Cabeza
   noStroke();
  triangle(650,80,500,300,630, 300); //Oreja  derecha
  triangle(450,80,470,300,630, 300); // Oreja izquierda
  fill(210, 240,0);
  ellipse(500,240,50,30);// Ojos
  ellipse(580,240,50,30);
  stroke(0);
  fill(0);
  ellipse(498,232,5,17); //Iris de los ojos
  ellipse(580,232,5,17);
  stroke(0);
   line(550, 250, 550, 278);
   line(525, 250, 520, 278);
   circle(535, 280, 30); //Nariz
   line(527,291,526,305);
    line(542,292,541,305);
   stroke(50);
   line(547, 280, 630, 300); // Bigotes derechos
   line(547, 280, 630, 320);
     line(547,280,630, 350);
      line(520, 280, 440, 300); //Bigotes izquierdos
   line(520, 280, 440, 320);
     line(520,280,440, 350);
    stroke(0);
     line(503,316,530,323);
    line(530,323,566,323);
    line(510,328,525,335);
     line(525,335,546,336);
}
