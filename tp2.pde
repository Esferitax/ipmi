String mitexto = "mi texto";
PFont miTipografia; 
int Y =200;
int Y2 =800;
int Y3 =800;
int Y4 =800;
int Y5 =800;
int pantalla;
int X1=200;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PFont fuente;

String estado;
void setup() {
  size(640, 480);
  
  fuente = loadFont("Arial.vlw");
  textFont(fuente);
 
  
  estado = "inicio";
  img1 = loadImage ("img1.jpg");
  img2 = loadImage ("img2.jpg");
  img3 = loadImage ("img3.jpg");
  img4 = loadImage ("img4.jpg");
  img5 = loadImage ("beck.gif");
  img6 = loadImage ("img6.jpg");
  img7 = loadImage ("img7.jpg");
 

  
}



void draw() {
background(255,0,0);
textFont(fuente);
textAlign(CENTER);
  println(pantalla);
  
  //para texto y movimiento
  
  if (pantalla==0) {
    image(img3, 0,0,640,480);
    fill(255);
    rect(195, 360, 250, 60);
    fill(0);
    textSize(30);
   text("Empezar", 320, 400);
   
       // inicio de la presentación
       
    if (estado== "pantalla") {  
       pantalla=1;
    }
  } else if (pantalla==1) {
     image(img4, 0, 0, 320, height);
     image(img5, width - 320, 0, 320, 480);
    
    fill(255);
    textSize(30);
    text(" YOU es una serie de Netflix que trata de un hombre con carencias afectivas que se obsesiona con una chica llamada Beck y no deja nunca de intentar enamorarla. Hasta lograrlo y empezar a controlar sus relaciones personales.", X1, Y2, 250, 600);
    Y2=Y2-1;
    
    if (Y2<-400) {
      Y= pantalla=2;
    }
  } else if (pantalla==2) {
  image(img1, 0,0,640,480);
    
       fill(255);
    textSize(30);
    text("Protagonistas", X1, Y3, 350, 50);
    textSize(20);
    text("Joe Goldberg es un hombre que vive las relaciones amorosas de forma muy posesiva, en cambio Beck es una jóven que vive su sexualidad libre de ataduras.", X1, Y3+75, 400, 400);
      Y3 -= 1;
   
    if (Y3<-400) {
      Y= pantalla=3;
    }
  } else if (pantalla==3) {
     image(img6, 0,0,640,480);
 
    
    textSize(CENTER);
    textSize(50);
    fill(250);
    textFont(fuente);
    
    text("Historia", X1, Y4, 350, 400);
    textSize(30);
    text("Joe logra controlar de cierta forma la vida de Beck escudandose en su amor por ella para cometer todo tipo de actos criminales, su obsesión poco a poco se descontrola hasta que Beck descubre los asesinatos que Joe cometió contra sus seres queridos, él descubre que ella ya lo sabe todo y la encierra en una carcel de cristal para mantenerla bajo control. En un descuido Beck logra escapar pero Joe acaba con su vida.", X1, Y4+75, 400, 2400);
    Y4=Y4-1;
    

    if (Y4<0-600) {
      Y= pantalla=4;
    }
  } else if (pantalla==4) {
    
      image(img2, 0,0,640,480);
    fill(255);
    textSize(30);
    text("Dalia Pastene - Legajo: 90593/6", width / 2, 100);
   fill(255);
    rect(460, 300, 140, 60);
    fill(0);
    textSize(25);
    text("Volver", 530, 340);  
     
  } 
}
void mousePressed() {
  if (pantalla == 0 && mouseX > 195 && mouseX < 445 && mouseY > 360 && mouseY < 420) {
    pantalla = 1;
  } else if (pantalla == 4 && mouseX > 460 && mouseX < 600 && mouseY > 300 && mouseY < 360) {
    
    // Reiniciar las posiciones para volver a ver el texto correctamente
    
    Y2 = 400;
    Y3 = 400;
    Y4 = 400;
    pantalla = 0;
  }
}
