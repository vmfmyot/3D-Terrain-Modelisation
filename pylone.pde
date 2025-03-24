/* Sidonie MINODIER
   Victoria MYOT
   L2 Info G3
*/
public PShape pylone(float h, float x, float y, float z){
  strokeWeight(3);
  stroke(50);
  // POINTS
  PVector O = new PVector(x, y, z); // origine
  PVector A = new PVector(O.x - (h/5)/2, O.y + (h/5)/2,   O.z + h);
  PVector B = new PVector(O.x + (h/5)/2, A.y,             A.z);
  PVector C = new PVector(A.x,           A.y,             O.z + 3*h/4);
  PVector D = new PVector(B.x,           C.y,             C.z);
  PVector E = new PVector(O.x - 1.5*h/5, A.y,             O.z);
  PVector F = new PVector(O.x + 1.5*h/5, A.y,             O.z);
  PVector G = new PVector(O.x - 2*h/5,   O.y,             A.z);
  PVector H = new PVector(O.x + 2*h/5,   O.y,             A.z);
  PVector I = new PVector(A.x,           A.y,             O.z+7*h/8);
  PVector J = new PVector(B.x,           A.y,             I.z);
  PVector K = new PVector(G.x,           O.y,             D.z);
  PVector L = new PVector(H.x,           O.y,             K.z);
  
  PVector A2 = new PVector(O.x - (h/5)/2, O.y - (h/5)/2,   O.z + h);
  PVector B2 = new PVector(O.x + (h/5)/2, A2.y,             A.z);
  PVector C2 = new PVector(A.x,           A2.y,             O.z + 3*h/4);
  PVector D2 = new PVector(B.x,           A2.y,             C.z);
  PVector E2 = new PVector(O.x - 1.5*h/5, A2.y,             O.z);
  PVector F2 = new PVector(O.x + 1.5*h/5, A2.y,             O.z);

  PVector I2 = new PVector(A.x,           A2.y,             O.z+7*h/8);
  PVector J2 = new PVector(B.x,           A2.y,             I.z);
  
  PShape p = createShape();
  p.beginShape(LINES);
  stroke(255, 0, 0);
  
  p.noFill();
  //petite face 1
  p.vertex(A.x, A.y, A.z); p.vertex(B.x, B.y, B.z);
  p.vertex(B.x, B.y, B.z); p.vertex(D.x, D.y, D.z);
  p.vertex(D.x, D.y, D.z); p.vertex(C.x, C.y, C.z);
  p.vertex(C.x, C.y, C.z); p.vertex(A.x, A.y, A.z);
  p.vertex(A.x, A.y, A.z); p.vertex(D.x, D.y, D.z);
  p.vertex(B.x, B.y, B.z); p.vertex(C.x, C.y, C.z);
  //petite face dos
  p.vertex(A2.x, A2.y, A2.z); p.vertex(B2.x, B2.y, B2.z);
  p.vertex(B2.x, B2.y, B2.z); p.vertex(D2.x, D2.y, D2.z);
  p.vertex(D2.x, D2.y, D2.z); p.vertex(C.x, C2.y, C2.z);
  p.vertex(C2.x, C2.y, C2.z); p.vertex(A.x, A2.y, A2.z);
  p.vertex(A2.x, A2.y, A2.z); p.vertex(D.x, D2.y, D2.z);
  p.vertex(B2.x, B2.y, B2.z); p.vertex(C.x, C2.y, C2.z);
  //côtés + haut
  p.vertex(A.x, A.y, A.z); p.vertex(A.x, A2.y, A.z); // haut
  p.vertex(A.x, A.y, A.z); p.vertex(B.x, B2.y, B.z);
  p.vertex(B.x, B2.y, B.z); p.vertex(B.x,  B.y, B.z);
  p.vertex(B.x,  B.y, B.z); p.vertex(A.x, A2.y, A.z);
  p.vertex(A.x, A2.y, A.z); p.vertex(C.x, C.y, C.z); //côté 1
  p.vertex(C.x, C.y, C.z); p.vertex(C.x, C2.y, C.z);
  p.vertex(C.x, C2.y, C.z); p.vertex(A.x, A.y, A.z);
  p.vertex(B.x, B2.y, B.z); p.vertex(D.x, D.y, D.z); //côté 2
  p.vertex(D.x, D.y, D.z); p.vertex(D.x, D2.y, D.z);
  p.vertex(D.x, D2.y, D.z); p.vertex(B.x, B.y, B.z);
  //grande face 1
  p.vertex(C.x, C.y, C.z); p.vertex(E.x, E.y, E.z);
  p.vertex(E.x, E.y, E.z); p.vertex(D.x, D.y, D.z);
  p.vertex(D.x, D.y, D.z); p.vertex(F.x, F.y, F.z);
  p.vertex(F.x, F.y, F.z); p.vertex(C.x, C.y, C.z);
  p.vertex(E.x, E.y, E.z); p.vertex(F.x, F.y, F.z);
  //grande face 2
  p.vertex(C.x, C2.y, C.z); p.vertex(E.x, E2.y, E.z);
  p.vertex(E.x, E2.y, E.z); p.vertex(D.x, D2.y, D.z);
  p.vertex(D.x, D2.y, D.z); p.vertex(F.x, F2.y, F.z);
  p.vertex(F.x, F2.y, F.z); p.vertex(C.x, C2.y, C.z);
  p.vertex(E.x, E2.y, E.z); p.vertex(F.x, F2.y, F.z);
  //grands côtés
  p.vertex(E.x, E.y, E.z); p.vertex(E.x, E2.y, E.z); //1
  p.vertex(E.x, E.y, E.z); p.vertex(C.x, C2.y, C.z);
  p.vertex(E.x, E2.y, E.z); p.vertex(C.x, C.y, C.z);
  p.vertex(F.x, F.y, F.z); p.vertex(F.x, F2.y, F.z); //2
  p.vertex(F.x, F.y, F.z); p.vertex(D.x, D2.y, D.z);
  p.vertex(F.x, F2.y, F.z); p.vertex(D.x, D.y, D.z);
  //pointes
  p.vertex(A.x, A.y, A.z); p.vertex(G.x, G.y, G.z); //gauche haut
  p.vertex(G.x, G.y, G.z); p.vertex(A.x, A2.y, A.z);
  p.vertex(G.x, G.y, G.z); p.vertex(I.x, I.y, I.z);
  p.vertex(G.x, G.y, G.z); p.vertex(I.x, I2.y, I.z);
  p.vertex(I.x, I.y, I.z); p.vertex(K.x, K.y, K.z); //gauche bas
  p.vertex(K.x, K.y, K.z); p.vertex(I.x, I2.y, I.z);
  p.vertex(K.x, K.y, K.z); p.vertex(C.x, C.y, C.z);
  p.vertex(K.x, K.y, K.z); p.vertex(C.x, C2.y, C.z);
  p.vertex(H.x, H.y, H.z); p.vertex(B.x, B.y, B.z); //droit haut
  p.vertex(H.x, H.y, H.z); p.vertex(B.x, B2.y, B.z);
  p.vertex(H.x, H.y, H.z); p.vertex(J.x, J.y, J.z); 
  p.vertex(H.x, H.y, H.z); p.vertex(J.x, J2.y, J.z);
  p.vertex(J.x, J.y, J.z); p.vertex(L.x, L.y, L.z); //droit bas
  p.vertex(J.x, J2.y, J.z); p.vertex(L.x, L.y, L.z); 
  p.vertex(L.x, L.y, L.z); p.vertex(D.x, D.y, D.z);
  p.vertex(L.x, L.y, L.z); p.vertex(D.x, D2.y, D.z);
  
  p.endShape();
  return p;
}
