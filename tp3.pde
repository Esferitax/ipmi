//Dalia Pastene Legajo 90593/6 Comisión 1

color estadoColorRayas = color(0);
boolean estadoMostrarInstruccion = true;

void setup() {
  size(800, 400);
}

void draw() {
  background(255);
  int stripeWidth = 13;
  color colorRayas = estadoColorRayas;

  // FONDO CON RAYAS DIAGONALES COMPLETAS
  pushMatrix();
  translate(500, 250);
  rotate(radians(-45));
  fill(colorRayas);
  noStroke();
  for (float i = -width; i < width; i += stripeWidth * 2) {
    rect(i, -height, stripeWidth, height * 4);
  }
  popMatrix();

  // CENTRO Y TAMAÑO DEL MARCO
  float marcoCenterX = width * 3 / 4.0;
  float marcoCenterY = height / 2.0;
  float marcoW = map(mouseX, 400, 800, 200, 300);
  float marcoH = map(mouseY, 0, 400, 200, 300);
  float marcoX = marcoCenterX - marcoW / 2;
  float marcoY = marcoCenterY - marcoH / 2;

  // DIBUJO DEL MARCO BLANCO
  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(marcoCenterX, marcoCenterY, marcoW, marcoH);

  // RAYAS VERTICALES DENTRO DEL MARCO, CON HUECO CENTRAL
  float centerX = marcoX + marcoW / 2;
  float centerY = marcoY + marcoH / 2;
  for (float i = marcoX; i < marcoX + marcoW; i += stripeWidth * 2) {
    float barX = i + stripeWidth / 2;
    boolean inGap = (barX > centerX - 100 / 2) && (barX < centerX + 100 / 2);
    fill(0);
    noStroke();
    if (inGap) {
      float top = marcoY;
      float bottomGap = centerY - 100 / 2;
      rect(barX, top + (bottomGap - top) / 2, stripeWidth, bottomGap - top);
      float topGap = centerY + 100 / 2;
      float bottom = marcoY + marcoH;
      rect(barX, topGap + (bottom - topGap) / 2, stripeWidth, bottom - topGap);
    } else {
      rect(barX, marcoY + marcoH / 2, stripeWidth, marcoH);
    }
  }

  // CUADRADO INTERIOR
  float cuadradito = 140;
  float clipX = marcoCenterX - cuadradito / 2;
  float clipY = marcoCenterY - cuadradito / 2;
  fill(255);
  noStroke();
  rect(marcoCenterX, marcoCenterY, cuadradito, cuadradito);

  // RAYAS DIAGONALES DENTRO DEL CUADRADO 
  clip(clipX, clipY, cuadradito, cuadradito);
  pushMatrix();
  translate(marcoCenterX, marcoCenterY);
  rotate(radians(45));
  fill(colorRayas);
  noStroke();
  float fullSize = cuadradito * 10;
  for (float i = -fullSize; i < fullSize; i += stripeWidth * 2) {
    rect(i, -fullSize / 4, stripeWidth, fullSize);
  }
  popMatrix();
  noClip();

  // TEXTO DE DISTANCIA
  float d = dist(mouseX, mouseY, marcoCenterX, marcoCenterY);
  fill(0);
  text("Distancia del centro del cuadradito: " + nf(d, 0, 2), 410, 20);

  // TEXTO DE INSTRUCCIONES E IMAGEN DE REFERENCIA
  if (estadoMostrarInstruccion) {
    fill(0);
    textSize(16);
    textAlign(LEFT);
    text("F ocultar la imágen. Click cambiar color. R reiniciar.", 410, 50);
    PImage referencia = loadImage("28.jpg");
    image(referencia, 0, 0, 400, 400);
  }
}

void mousePressed() {
  estadoColorRayas = color(random(255), random(255), random(255));
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    estadoColorRayas = color(0);
    estadoMostrarInstruccion = true;
  } else if (key == 'f' || key == 'F') {
    estadoMostrarInstruccion = false;
  }
}
