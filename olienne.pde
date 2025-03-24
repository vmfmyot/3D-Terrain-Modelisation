/* Sidonie MINODIER
   Victoria MYOT
   L2 Info G3
*/

PShape base;
PShape pales;
PShape pale;

/*
void setup(){
  size(1000, 1000, P3D);
 
}

void draw(){
  background(250);
  pushMatrix();
  translate( width/2, 3*height/4, 0);
  rotateY(frameCount/50.0);
  rotateX(PI/2);
  lights();
  shape(eolienne(150));
  popMatrix();
}
*/

public PShape base(float h, float x, float y, float z){
  pushMatrix();
  translate(0,0,h);
  float R=h/20; //rayon de la base
  float r=R/2; //rayon du sommet
  
  int N=10; //nb de cercles
  float dz=h/N; //distance entre deux cercles
  float dr=(r-R)/N; //différence de rayon entre deux cercles
  
  int n=15; //nombre de points par cercle
  
  noStroke();
  fill(220);
  PShape p = createShape();
  p.beginShape(TRIANGLE_STRIP);
  for (float i=0; i<h;i+=dz){ //on parcourt en hauteur
    for (float j=-PI; j<=PI; j+=2*PI/n) {//on parcourt le cercle courant
      p.vertex(x+cos(j)*R,y+sin(j)*R,z+i);
      p.vertex(x+cos(j)*(R+dr),y+sin(j)*(R+dr),z+i+dz);
    }
    R+=dr;
  } 
  p.endShape();
  popMatrix();
  return p;
}

public PShape pale(float h, float angle, float X, float Y, float Z){
  float k=h/20;
  float l=2*h/3;
  float d=PI/8;
   noStroke();
  fill(220);
  PShape p = createShape();
    p.setFill(color(255));

  p.beginShape();
    float x= cos(angle)*l;
    float y=sin(angle)*l;
    p.vertex(X+0,Y+h,Z+k);
    p.bezierVertex(X+cos(angle-d)*l,Y+sin(angle-d)*l+h,Z+k,
                  X+cos(angle)*l,Y+sin(angle)*l+h,Z+k,
                  X+x,Y+y+h,Z+k);
    p.vertex(X+0,Y+h,Z+k);
    p.bezierVertex(X+cos(angle+d)*l,Y+sin(angle+d)*l+h,Z+k,
                  X+cos(angle)*l,Y+sin(angle)*l+h,Z+k,
                  X+x,Y+y+h,Z+k);
  p.endShape();
  p.rotateX(PI/2);
  p.rotateY(frameCount/50.0);
  return p;
}

public PShape pales(float h){
  PShape p = createShape(GROUP);
    p.setFill(color(255));

  for(float i=0; i<=2*PI; i+=2*PI/3){
    p.addChild(pale(h,i,0,-h,0));
  }
  translate(0,0,h);
  return p;
}

public PShape rotor(float h, float X, float Y, float Z){
   PShape p = createShape(GROUP);
     p.setFill(color(255));

   PShape s=createShape(SPHERE,h/20);
   s.translate(X,Y-h/80,Z);
   p.addChild(s);
   
   PShape r=createShape(BOX, h/20,h/10,h/20);
   r.translate(X,Y+h/10/3,Z);
   p.addChild(r);
   return p;
}



public PShape eolienne(float h){
  PShape p = createShape(GROUP);
          resetShader();
  p.setFill(color(255));
  
  PShape pales= pales(h);
  p.addChild(pales);
  
  p.addChild(base(h, 0,0,-h));
  
  PShape r=rotor(h,0,0,0);
  p.addChild(r);

  return p;
  
}
