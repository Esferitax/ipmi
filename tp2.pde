// Pastene Dalia

PImage img1; //Carga de imágenes
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img;
int x, y, ancho, alto;
color relleno;
int cambioIntervalo = 10000; // 10 segundos en milisegundos
int ultimaVez;
boolean mostrarimg2 = true;

void setup() {
  size(640, 480); // Tamaño del lienzo
  img1 = loadImage("house1.jpg"); // Carga la imagen
  img2 = loadImage("house2.jpg");
  x = 100;
  y = 80;
  ancho = 120;
  alto = 50;
  relleno = color(0, 0, 255);
    ultimaVez = millis();
}

void draw() {
  background(255); // Fondo blanco
  image(img1, 0, 0, 640, 480); 
  fill(relleno);
  rect(x, y, ancho, alto);
  x++;
  if (x > width) {
    x = -ancho;
  }
}
void mousePressed() {
  if (mouseX>= x && mouseX< x+ancho && mouseY>y && mouseY< y+alto) {
    relleno = color(255, 0, 0);
  }
}
void keyPressed() {
  if (key=='v' || key=='V') {
    relleno = color(0, 255, 0);
  }
 if (mostrarimg2) {
    image(img1, 0, 0, width, height);
  } else {
    image(img2, 0, 0, width, height);
  }
}
