/* Sidonie MINODIER
   Victoria MYOT
   L2 Info G3
*/
PShape map;

float posX=0;
float posY=0;
float posZ=0;
float angle=PI/2;
float centerX=posX+cos(angle);
float centerY=posY+sin(angle);
float centerZ=-200;

PVector[] highCoord;

PShader myShader;

PShape gl;
PShape pl;
PShape pl2;
PShape pl3;
PShape pl4;


boolean eoliennes=false;
boolean repere=false;
boolean pylones=false;

public void setup() {
  size(1000, 600, P3D);
  myShader=loadShader("TexFrag.glsl","TexVert.glsl");
  map = loadShape("hypersimple.obj");
  highCoord=getHighCoord(50);
 

  gl=groundLines();
  pl=pyloneLines(0, 0, -33, 33);
  pl2 = pyloneLines(-65, 65, -100, 10);
  pl3 = pyloneLines(90, 0, -60, -150);
  pl4 = pyloneLines(130, 130, -110, 150);

  System.out.println("Avancer : flèche vers le haut");
  System.out.println("Reculer : flèche vers le bas");
  System.out.println("Regarder à droite : flèche vers la droite");
  System.out.println("Regarder vers la gauche : flèche vers la gauche");
  System.out.println("Afficher le repère : R");
  System.out.println("Afficher les pylones : P");
  System.out.println("Afficher les eoliennes : E");
  System.out.println("Lever les yeux : A ou Q");
  System.out.println("Baisser les yeux : Z ");
  System.out.println("Reset l'angle de la caméra : 0");


}


public void draw() {
  lights();
  background(200,230,255); 
  
  shader(myShader);
    shape(map);

  translate(0,0,-200);
  lights();
  stroke(10);
  
  if(repere){
  beginShape(LINES);
  //x=red
      stroke(255,0,0);
      vertex(-500,0,0);
      vertex(500,0,0);
      
    //y=green  
      stroke(0,255,0);
      vertex(0,500,0);
      vertex(0,-500,0);
      
      
      //z=blue
      stroke(0,0,255);
      vertex(0,0,500);
      vertex(0,0,-500);
    endShape();
  }
    camera(posX, posY, posZ+2,centerX,centerY,centerZ+2,0,0,-1);
    float fov = PI/3.0;
    float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(fov, float(width)/float(height), 1, cameraZ*10.0);
    
    translate(0, 0, getZ(0, 0)+200);
    
    if(pylones){
    fill(255, 0, 0);

    affichePylones(0, 0, -33, 33);
    affichePylones(-65, 65, -100, 10);
    affichePylones(90, 0, -60, -150); 
    affichePylones(130, 130, -110, 150);
  
    translate(0, 0, 1);
    shape(pl2);    
    shape(pl4);
    shape(pl3);
    shape(pl);
    }
    
    if(eoliennes){
      for (PVector v : highCoord){
        pushMatrix();
        translate(v.x,v.y,v.z-1.5);
        shape(eolienne(5));
        popMatrix();
        shape(gl);
      }
     
    }
    
    //VILLE aux coordonnées x=20 et y=100 :
    shape(ville(20, 100, getZ(20,100)));

    
}


public void keyPressed(){
  
  float da=PI/8; //angle duquel on tourne
  float d=40;    //distance de laquelle on avance
  if(keyCode==38){
    posY=centerY;
    posX=centerX;
    centerX+=cos(angle);
    centerY+=sin(angle);
    posZ=getZ(posX,posY);
    centerZ=getZ(posX,posY);

  }
  
  if(keyCode==37){
    angle-=da;
    centerY=posY+sin(angle);
    centerX=posX+cos(angle);
  }
  if(keyCode==39){
    angle+=da;
    centerY=posY+sin(angle);
    centerX=posX+cos(angle);
    
  }
  
  if(keyCode==81){ //A ou Q: REGARDER VERS LE HAUT
    centerZ+=da;
  }
  if(keyCode==87){ //Z : REGARDER VERS LE BAS
    centerZ-=da;
  }
  if(keyCode==128){ //0 : RESET
    centerZ=getZ(posX,posY);
  }
  
  if(keyCode==69){//E : affichage / désaffichage éoliennes
    eoliennes=!eoliennes;}
    
   if(keyCode==82){//R : affichage / désaffichage repère
       repere=!repere;}
       
   if(keyCode==80){//P : affichage / désaffichage pylonnes
       pylones=!pylones;}    

  
}
