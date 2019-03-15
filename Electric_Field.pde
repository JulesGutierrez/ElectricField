Point[] points;
int N = 2;
int POS_POINT_CHARGE = 500;
int NEG_POINT_CHARGE = -300;
int POINT_RADIUS = 20;
float PARTICLE_CHARGE = 100;
int PARTICLE_AMOUNT = 10000;
float MASS = 1;

Particle[] particles = new Particle[PARTICLE_AMOUNT];


void setup() {
  size(800, 800);
  points = new Point[N];
  points[0] = new Point(NEG_POINT_CHARGE, new PVector(150, height/2));
  points[1] = new Point(POS_POINT_CHARGE, new PVector(650, height/2));
  for (int i = 0; i< PARTICLE_AMOUNT; i++) {
    particles[i] = new Particle(PARTICLE_CHARGE, points[1], points[0]);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < points.length; i++) {
    points[i].render();
  }
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].render();
  }
}

void mousePressed() {
  noLoop();
}
