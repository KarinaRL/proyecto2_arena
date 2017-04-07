class Pin {
  
  Body body;
  float x, y;
  float r, h;
  
  Pin(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.type = BodyType.STATIC;
    
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.setRadius(box2d.scalarPixelsToWorld(r));

    body.createFixture(cs, 1);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    pushMatrix();
    translate(pos.x, pos.y);
    //rotate(-a);
    pushStyle();
    fill(#AA954F);
    stroke(0);
    
    ellipse(0, 0, r*4, r*4);
    popStyle();
    popMatrix();
  }
  
}