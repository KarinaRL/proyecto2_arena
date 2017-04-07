class Ball {
  
  Body body;
  float r;
  Vec2 pos; 
  boolean bFinalPosCheck;
  
  Ball(float r_, float density_, float restitution_) {
    r = r_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(width/2, 100));
    bd.type = BodyType.DYNAMIC;
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    float box2Dr = box2d.scalarPixelsToWorld(r_);
    cs.setRadius(box2Dr);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = density_;
    fd.restitution = restitution_;
    
    body.createFixture(fd);
    bFinalPosCheck = false;
  }
  

  void display() {
    pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle(); 
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    pushStyle();
    
    if(sveglio() == 1) {
      fill(0, 255, 0);
    } 
    stroke(0);
   
    ellipse(0, 0, 2*r, 2*r);
    line(0, 0, r, 0);
    
    popStyle();
    popMatrix();
  }
  
  int sveglio() {
    int i = 0;
    if(body.isAwake()) 
      i = 50;
     else
       i = 0;
       
    return i;
  }

  boolean finalPositionCheck() {
    return bFinalPosCheck;
  }
  
}