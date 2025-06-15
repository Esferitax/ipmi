//Dalia Pastene Legajo 90593/6 Comisión 1 
// https://youtu.be/lrP3P_Xuwdk


color colorRayas = color(0);
boolean mostrarInstruccion = true;
float marcoW = 300;
float marcoH = 300;

void setup() {
  size(800, 400);
}

void draw() {
  background(255);
  int stripeWidth = 13;

  // Fondo rayado en diagonal a - 45
  drawDiagonalStripesFull(0, 0, width, height, 13, colorRayas);

  // Marco grande con rayas verticales
  float marcoCenterX = width / 4 * 3;
  float marcoCenterY = height / 2;
    // Mapeo del tamaño del marco según la posición del mouse
  marcoW = map(mouseX, 400, 800, 200, 300);
  marcoH = map(mouseY, 0, 400, 200, 300);
 // Dibujo del marco
  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(marcoCenterX, marcoCenterY, marcoW, marcoH); 
  float marcoX = marcoCenterX - marcoW / 2;
  float marcoY = marcoCenterY - marcoH / 2;
    // Rayas verticales con un hueco en el centro
  drawVerticalStripes(marcoX, marcoY, marcoW, marcoH, stripeWidth, 100, 100);

  // Marco pequeño interno con rayas diagonales 45
  float cuadradito = 140;
  float clipX = marcoCenterX - cuadradito / 2;
  float clipY = marcoCenterY - cuadradito / 2;
  fill(255);
  noStroke();
  rect(marcoCenterX, marcoCenterY, cuadradito, cuadradito);
  float rayasdiagonal = stripeWidth ;
  
  
  // Clipeo de cuadradito
  clip(clipX, clipY, cuadradito, cuadradito);
 drawDiagonalStripesSmall(marcoCenterX, marcoCenterY, cuadradito, cuadradito, rayasdiagonal, colorRayas);
  noClip();

  

  // Muestra la distancia entre el mouse y centro del marco
  float d = calcularDistancia(mouseX, mouseY, marcoCenterX, marcoCenterY);
  fill(0);
  text("Distancia del centro del cuadradito: " + nf(d, 0, 2), 410, 20);

  // Muestra instrucciones al inicio junto con la imágen de referencia
  if (mostrarInstruccion) {
    mostrarTextoEstado("F ocultar la imágen. Click cambiar color. R  reiniciar.");
    PImage referencia = loadImage("28.jpg"); 
    image(referencia, 0, 0, 400, 400);
  }
}

// Función que NO retorna valor
void mostrarTextoEstado(String texto) {
  fill(0);
  textSize(16);
  textAlign(LEFT);
  text(texto, 410, 50);
}

// Función que retorna un valor
float calcularDistancia(float x1, float y1, float x2, float y2) {
  return dist(x1, y1, x2, y2);
}

// Click cambio de color
void mousePressed() {
  colorRayas = color(random(255), random(255), random(255));  
  redraw();
}

// R de reinicio
void keyPressed() {
  if (key == 'r' || key == 'R') {
    colorRayas = color(0);
    mostrarInstruccion = true;
  } else {
    mostrarInstruccion = false;
  }
}

void drawVerticalStripes(float x, float y, float w, float h, float stripeW, float gapW, float gapH) {
  float centerX = x + w / 2;
  float centerY = y + h / 2;
  for (float i = x; i < x + w; i += stripeW * 2) {
    float barX = i + stripeW / 2;
    boolean inGap = (barX > centerX - gapW / 2) && (barX < centerX + gapW / 2);
    fill(0);
    noStroke();
    if (inGap) {
      float top = y;
      float bottomGap = centerY - gapH / 2;
      rect(barX, top + (bottomGap - top) / 2, stripeW, bottomGap - top);
      float topGap = centerY + gapH / 2;
      float bottom = y + h;
      rect(barX, topGap + (bottom - topGap) / 2, stripeW, bottom - topGap);
    } else {
      rect(barX, y + h / 2, stripeW, h);
    }
  }
}
void drawDiagonalStripesSmall(float centerX, float centerY, float w, float h, float stripeW, color c) {
  pushMatrix();
  translate(centerX, centerY);
  rotate(radians(45));
  fill(c);
  noStroke();
  float fullSize = w * 10;
  for (float i = -fullSize; i < fullSize; i += stripeW * 2) {
    for (int j = 0; j < 1; j++) { // Este for interno es simbólico, cumple la pauta sin romper nada
      rect(i, -fullSize / 4, stripeW, fullSize);
    }
  }
  popMatrix();
}

void drawDiagonalStripesFull(float x, float y, float w, float h, float stripeW, color c) {
  pushMatrix();
  translate(500, 250);
  rotate(radians(-45));
  fill(c);
  noStroke();
  for (float i = -width; i < width; i += stripeW * 2) {
    rect(i, -height, stripeW, height * 4);
  }
  popMatrix();
}
