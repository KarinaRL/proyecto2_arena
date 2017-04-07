class Slide {
  
  Body body;
  
  Vec2[] vertices;
  int nVertices;
 
  Vec2 initPos;
  float angle;
  
  Slide(Vec2 vs[], int nVertices_, Vec2 initPos_, float angle_) {
    
    // data conversion
    nVertices = nVertices_;
    vertices = new Vec2[nVertices_];
    for(int i = 0; i < nVertices; i++) {
      float x = box2d.scalarPixelsToWorld( vs[i].x );
      float y = box2d.scalarPixelsToWorld( -vs[i].y );
      vertices[i] = new Vec2(x, y);
    }
    initPos = box2d.coordPixelsToWorld(initPos_); 
    angle = angle_;

    BodyDef bd = new BodyDef();
    bd.position.set(initPos);
    bd.angle = radians(-angle);    
    bd.type = BodyType.STATIC;
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, nVertices);
    
    body.createFixture(ps, 1);
  }
  
  void display() {

    Vec2 pos = box2d.getBodyPixelCoord(body); 
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x, pos.y); 
    rotate(-a);
    
    pushStyle();
    strokeWeight(1);
    stroke(0);
    fill(#AD6610);
    
    beginShape();
      for(Vec2 v: vertices) {
        float x = box2d.scalarWorldToPixels(v.x);
        float y = box2d.scalarWorldToPixels(-v.y);
        vertex(x, y);
      }
    endShape(CLOSE);
    
    popStyle();
    popMatrix();
  }  
}