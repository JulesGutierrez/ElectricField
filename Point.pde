class Point{
  float charge;
  PVector pos;
  int r = POINT_RADIUS;
  
  Point(float charge, PVector pos){
    this.charge = charge;
    this.pos = pos;
  }
  
  
  void render(){
    strokeWeight(1);
    stroke(0);
    if (this.charge > 0){
      fill(255,165,0);
    } else if (this.charge < 0){
      fill(135, 206, 250);
    } else {
      fill(120, 120, 120);
    }
    circle(this.pos.x, this.pos.y, this.r * 2);
  }
  
  PVector field(PVector point){
    PVector dir = new PVector(point.x - this.pos.x, point.y - this.pos.y);
    float mag = this.charge / pow(point.dist(this.pos), 2);
    dir.setMag(mag);
    return dir;
  }

}
