PImage img;     
int rows = 40; // Número de filas
int cols = 40; // Número de columnas
float maxDiameter = 20; // Tamaño máximo 
color ellipseColor = color(0, 255); // Color inicial 

void setup() {
  size(800, 400);  
  background(255); 
  noStroke();   
  fill(ellipseColor);
  img = loadImage("Riley.jpg");  
  image(img, 0, 0, 400, 400); 
}

void draw() {
  background(255); 
  image(img, 0, 0, 400, 400);  
  float centerX = 600;  // Centro en x (en la mitad derecha de la ventana)
  
  for (int y = 10; y < height; y +=20) {
    for (int x = 400; x < width; x += 20) {
      float[] sizes = calculateEllipseSize(x, centerX, maxDiameter, 5);
      float ellipseWidth = sizes[0];
      float ellipseHeight = sizes[1];
      
       fill(red(ellipseColor), green(ellipseColor), blue(ellipseColor), alpha(ellipseColor));
      ellipse(x, y, ellipseWidth, ellipseHeight); 
    }
  }
}

void mousePressed() {
   ellipseColor = color(random(127), random(127), random(127), 127);
}

float[] calculateEllipseSize(float x, float centerX, float minDiameter, float maxDiameter) {
  float distY = abs(x - centerX);
  
  // Calcula el ancho y el alto del elipse en función de la distancia al centro horizontal
  float ellipseWidth = map(distY, 0, centerX - 200, maxDiameter, minDiameter);
  float ellipseHeight = map(distY, 0, centerX - 200, minDiameter, maxDiameter);
  
  // Array con el ancho y el alto
  return new float[] { ellipseWidth, ellipseHeight };
}


// Dalia Pastene - Legajo 90593/6 - Comisión 1 - Intro a programación
// https://youtu.be/8IlvqI-pTt0
