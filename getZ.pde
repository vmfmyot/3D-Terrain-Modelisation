/* Sidonie MINODIER
   Victoria MYOT
   L2 Info G3
*/

public float getZ(float x, float y){
  for (int i = 0; i < map.getChildCount(); i++) {
    if(isInTriangle(map.getChild(i), x, y)){return calcZ(map.getChild(i), x, y);}
  }
  return -200;
}

public float calcZ(PShape triangle, float x, float y){  
  PVector A=triangle.getVertex(0); //on recupère les vecteurs
  PVector B=triangle.getVertex(1);
  PVector C=triangle.getVertex(2);
  
  float da=dist(A.x, A.y, x, y); //on calcule la distance
  float db=dist(B.x, B.y, x, y);
  float dc=dist(C.x, C.y, x, y);
  
  //on calcule le coef de la règle de 3 et on veut que ce soit inversement prop à la distance
  float coef=1/da+1/db+1/dc;  
  
  float ca=(1/da)/coef; //on l'applique à nos distances
  float cb=(1/db)/coef;
  float cc=(1/dc)/coef;
  
  float res=A.z*ca+B.z*cb+C.z*cc; //on multiplie le z par le coeff de la distance
  
  return res;
}

public boolean isInTriangle(PShape triangle, float x, float y){
  PVector A=triangle.getVertex(0); //on récupère les vecteurs
  PVector B=triangle.getVertex(1);
  PVector C=triangle.getVertex(2);
  
  if(test(A,B,x,y)){return test(B, C, x, y) && test(C, A, x, y);}
  else{return (!test(B, C, x, y)) && (!test(C, A, x, y));} 
}

public boolean test(PVector v1, PVector v2, float x, float y){
  return(v1.x-x)*(v2.y-y)-(v1.y-y)*(v2.x-x)>0;
}
