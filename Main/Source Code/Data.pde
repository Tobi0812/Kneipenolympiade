/*
An enumeration type for different colors.
*/
enum Color { 
 WHITE(255, 255, 255),
 BLACK(0,0,0),
 YELLOW(255,255,0),
 BLUE(0, 0, 255),
 RED(255, 0, 0),
 GREEN(0,255,0),
 CYAN(0,255,255),
 PURPLE(160,32,240),
 ORANGE(255,165,0),
 GRAY(128, 128, 128),
 PINK(255, 102, 178);
 
 int r, g, b;
 
 private Color(int r, int g, int b) {
   this.r = r;   
   this.g = g;
   this.b = b;
 }
}

class Point {
  int x, y;
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

class Hole {
   Point point;
   int scoring;
   int radius;
   Hole(Point point, int scoring, int radius) {
     this.point = point;
     this.scoring = scoring;
     this.radius = radius;
   }
}

Hole[] holes = {
  new Hole(new Point(175, 250), 10, 75),
  new Hole(new Point(175, 150), 20, 60),
  new Hole(new Point(175, 75), 30, 45),
  new Hole(new Point(275, 120), 50, 45),
  new Hole(new Point(75, 120), 50, 45)
};

void sout(String text) {
  System.out.println(text);
}
