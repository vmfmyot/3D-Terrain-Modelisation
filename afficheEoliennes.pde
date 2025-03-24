/* Sidonie MINODIER
   Victoria MYOT
   L2 Info G3
*/
public PShape groundLines(){
      PShape p = createShape(GROUP);

      for (PVector v : highCoord){
        pushMatrix();
        p.addChild(groundLine(v.x, v.y,20, 100));
        popMatrix();
      }
      return p;
}
public PShape groundLine(float x, float y,float destX, float destY){
    strokeWeight(5);
    stroke(50);
    PShape p = createShape();
    int n=50; //nombre de sous-parties
    float dx= (destX-x)/n;
    float dy= (destY-y)/n;
    p.beginShape(LINES);
    for(float i=0; i<n; i++){
      p.vertex(x,y, getZ(x,y));
      p.vertex(x+dx, y+dy, getZ(x+dx,y+dy));
      x+=dx;
      y+=dy;
    }
    p.endShape();
    return p;
}

public PVector[] getHighCoord(int n){
  PVector[] liste=new PVector[n];
  float zMin=-10000;
  int init=0;
  for (int i = 0; i < map.getChildCount(); i++) {
    for (int j = 0; j < map.getChild(i).getVertexCount(); j++) {
      PVector v = map.getChild(i).getVertex(j);
        if(init<n){ //on remplit l'array avec les n premières valeurs
          liste[init]=v;
          init++;
          zMin=getMinZ(liste, init);
        }
        else if(v.z>zMin && !isAlreadyIn(liste,v)){
          replace(liste, v);
          zMin=getMinZ(liste, init);
          i++; j=0;
        }
     }
  }
  return liste;
}

public boolean isAlreadyIn(PVector[]l, PVector v){
  for(PVector vec : l){
    if(vec.x==v.x && vec.y==v.y) return true;
  }
  return false;
}

public PVector[] replace(PVector[]l, PVector v){
  float m=l[0].z;
  int index=0;
  for (int i=0; i<l.length; i++){
    if(l[i].z<m){
      m=l[i].z;
      index=i;
    }
  }
  l[index]=v;
  return l;
}

public float getMinZ(PVector[]l, int n){
  float min=l[0].z;
  for (int i=0; i<n; i++){
    if(min>l[i].z){
      min=l[i].z;
    }
  }
  return min;
}

/*Dessine une ville
 partir de coordonnées x, y et z
 données en paramètres
*/
public PShape ville(float x, float y, float z){
  noStroke();
  fill(120);
  PShape g = createShape(GROUP);
  pushMatrix();
  translate(x, y, z);
  //1ère tour :
  translate(0, 0, 5/2-1); box(5);
  translate(0, 0, 5/2); box(5);
  translate(0, 0, 5/2); box(5);
  
  //2ème tour :
  translate(-8, 5, -(5/2-1)-2*5/2); box(5);
  translate(0, 0, 5/2); box(5);
  translate(0, 0, 5/2); box(2);
  translate(0, 0, 1); box(2);
  
  translate(-8, 5, -1-(2*5/2)); box(7);
  
  translate(16+3, -10+6, -3); box(10);
  
  translate(-x-3, -y-6, +3);
  popMatrix();
  noFill();
  return g;
}
