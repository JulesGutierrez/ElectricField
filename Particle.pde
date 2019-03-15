class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float charge;
  int r = 1;
  float mass = MASS;
  Point source;
  Point end;
  boolean spawned = false;
  float angle;

  Particle(float charge, Point source, Point end) {
    this.charge = charge;
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    this.source = source;
    this.end = end;
    this.angle = random(0.1, TWO_PI-0.1);
  }

  void spawn() {
    if (!this.spawned) {
      PVector vector = PVector.fromAngle(random(0.1, TWO_PI-0.1));
      vector.setMag(POINT_RADIUS);
      vector.add(source.pos);
      this.pos = vector.copy();
      this.spawned = true;
    } else {
      PVector vector = PVector.fromAngle(random(0.1, TWO_PI-0.1));
      vector.setMag(POINT_RADIUS);
      vector.add(source.pos);
      this.pos = vector.copy();
    }
  }

  void update() {
    if (!this.spawned) {
      if (random(1) < 0.005) {
        this.spawn();
      } else return;
    }

    this.acc.setMag(0);
    PVector field = new PVector(0, 0);
    for (int i = 0; i < N; i++) {
      PVector f = points[i].field(this.pos);
      /*
      stroke(255, 0, 0);
       PVector dir = PVector.fromAngle(f.heading());
       dir.setMag(30);
       push();
       translate(this.pos.x, this.pos.y);
       line(0, 0, dir.x, dir.y);
       pop();  
       
       
       print("field ", f, "from point ", i, "\n");
       */
      field.add(f);
    }
    field.mult(this.charge);
    this.acc = field.copy();
    this.acc.div(mass);
    /*
    print("acc", this.acc.mag(), "\n");
     */
    this.vel.add(this.acc);
    this.vel.limit(2);
    this.pos.add(this.vel);

    if (this.pos.dist(this.end.pos) < 10) {
      this.vel.setMag(0);
      this.spawned = false;
      this.spawn();
    }
  }

  void render() {
    if (this.spawned) {
      noStroke();
      fill(0);
      circle(this.pos.x, this.pos.y, this.r*2);
    }
  }
}
