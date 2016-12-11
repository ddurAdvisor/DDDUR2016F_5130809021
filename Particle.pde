  class Particle {


  float lifespan = 255;
  
  PShape part;
  float partSize;
  Particle(float size) {
    partSize = size;
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(sprite);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    part.endShape();
    
    part.setTint(color(0,191,255,10));

  }

  PShape getShape() {
    return part;
  }
}
