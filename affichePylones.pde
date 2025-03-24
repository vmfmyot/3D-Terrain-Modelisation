/* Sidonie MINODIER
   Victoria MYOT
   L2 Info G3
*/

/* Affiche des pylônes entre les points
   (x1, y1) et (x2, y2)
   Relie les pylônes entre eux par des lignes électriques
*/
public void affichePylones(float x1, float y1, float x2, float y2){
    float h = 2; //hauteur d'1 pylône

  pushMatrix();
  
  //Vecteur directeur X1X2 :
  PVector d = new PVector( x2-x1, y2-y1 );
  //Angle entre l'axe des x et o :
  float angle = PVector.angleBetween(new PVector(0, 1), d);
  
  // distance entre les 2 points passés en paramètre :
  float dist = sqrt( (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) );

  //on espace les pylônes de 5 pixels (à définir) :
  int ecart = 5;
  int N = int(dist/ecart);
  float dx = (x2-x1)/N;
  float dy = (y2-y1)/N;
  
  translate(x1, y1, getZ(x1, y1)-1);
  
  for(int i = 0; i < N; i++){
    stroke(255, 0, 0);
    PShape pp = pylone(h, 0, 0, 0);
    pp.rotateZ(angle);
    shape(pp);
    
    noFill();  
    translate(-x1, -y1, -(getZ(x1, y1)-1));
    x1+=dx; y1+=dy;
    
    translate(x1, y1, getZ(x1, y1)-1);
   }
  PShape pp = pylone(h, 0, 0, 0);
  pp.rotateZ(angle);
  shape(pp);
  popMatrix();
  
}


public PShape pyloneLines(float x, float y,float destX, float destY){
  float hauteur =2;
  PShape p = createShape(GROUP);

  pushMatrix();
  
  //on stock les points de départ au cas-où :
  float xx1 = x; float yy1 = y;
  
  // distance entre les 2 points passés en paramètre :
  float dist =dist(x,y,destX, destY);
  //on espace les pylônes de 5 pixels (à définir) :
  int ecart = 5;
  int N = int(dist/ecart);
  float dx = (destX-x)/N;
  float dy = (destY-y)/N;
  
  translate(x, y, getZ(x, y)-2);
  
  for(int i = 0; i < N; i++){
    stroke(255, 0, 0);   
    noFill();  
    
    translate(-x, -y, -(getZ(x, y)-2));
    x+=dx; y+=dy;
    p.addChild(pyloneLine(x, y, xx1, yy1, hauteur));
    translate(x, y, getZ(x, y)-2);
    xx1+=dx; yy1+=dy;
  }

  return p;
}

  
public PShape pyloneLine(float x, float y,float destX, float destY, float hauteur){
    
    //Vecteur directeur x->destX :
    PVector d = new PVector( destX-x, destY-y );
    //Vecteur orthogonal :
    PVector o = new PVector( -d.y, d.x );
    int ecartLignes = 15;
    
    float x2 = x; float y2 = y;
    float destX2 = destX; float destY2 = destY;
    
    float xx = x; float yy = y; //pour garder les lignes alignées au niv des getZ pylones
    float destXX = destX; float destYY = destY;
    
    PShape g = createShape(GROUP);
    noFill();
    stroke(0);
    for(int i = 0; i < 3; i++){
    
    //"côté" 1 :
    PShape p = createShape();
    p.beginShape();
    p.vertex(x,y, getZ(xx,yy));
    p.bezierVertex(
      (x+destX)/2, (y+destY)/2, getZ( x,y )-1,
      (x+destX)/2, (y+destY)/2, getZ( x,y )-1,
      destX, destY, getZ(destXX,destYY));
    //on a fixé le milieu en temps que point de contrôle
    p.endShape();
    g.addChild(p);
    
    //lignes du "bas" :
    PShape p2 = createShape();
    p2.beginShape();
    p2.vertex(x,y, getZ(xx,yy)-hauteur/4);
    p2.bezierVertex(
      (x+destX)/2, (y+destY)/2, getZ( x,y )-1-hauteur/4,
      (x+destX)/2, (y+destY)/2, getZ( x,y )-1-hauteur/4,
      destX, destY, getZ(destXX,destYY)-hauteur/4);
    p2.endShape();
    g.addChild(p2);
    
    //"côté" 2 :
    PShape p3 = createShape();
    p3.beginShape();
    p3.vertex(x2,y2, getZ(xx,yy));
    p3.bezierVertex(
      (x2+destX2)/2, (y2+destY2)/2, getZ( x2,y2 )-1,
      (x2+destX2)/2, (y2+destY2)/2, getZ( x2,y2 )-1,
      destX2, destY2, getZ(destXX,destYY));
    p3.endShape();
    g.addChild(p3);
    
    PShape p4 = createShape(); //bas
    p4.beginShape();
    p4.vertex(x2,y2, getZ(xx,yy)-hauteur/4);
    p4.bezierVertex(
      (x2+destX2)/2, (y2+destY2)/2, getZ( x2,y2 )-1-hauteur/4,
      (x2+destX2)/2, (y2+destY2)/2, getZ( x2,y2 )-1-hauteur/4,
      destX2, destY2, getZ(destXX,destYY)-hauteur/4);
    p4.endShape();
    g.addChild(p4);
    
    //incrémentations et décrémentations :
    x2-=o.x/ecartLignes; y2-=o.y/ecartLignes;
    destX2-=o.x/ecartLignes; destY2-=o.y/ecartLignes;
    
    x+=o.x/ecartLignes; y+=o.y/ecartLignes;
    destX+=o.x/ecartLignes; destY+=o.y/ecartLignes;
    }
    
    return g;

}
