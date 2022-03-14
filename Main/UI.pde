void fill(Color c) {
  fill(c.r, c.g, c.b);
}

void background(Color c) {
  background(c.r, c.g, c.b);
}

/*
Draws a circle on the given Point with the given width and height
*/
void drawCircle(Color c, Point p, int w_h) {
  fill(c);
  circle(p.x, p.y, w_h);
}

/*
Draws a text to a given Point.
*/
void drawText(Color c, int textsize, String text, Point p) {
  fill(c);
  textSize(textsize);
  text(text, p.x, p.y);
  textAlign(CENTER);
}

/*
Draws the holes where the player will throw the ball in.
*/
void drawHoles() {
  for (int i = 0; i < holes.length; i = i+1) {
    drawCircle(Color.WHITE, holes[i].point, holes[i].radius);
    drawText(Color.BLUE, 20, String.valueOf(holes[i].scoring), new Point(holes[i].point.x, holes[i].point.y + 10)); 
  }
}

void drawField() {
  // borders of the box
  /* top */    line(30,  50,    350, 50);
  /* left */   line(30,  50,    30,  550);
  /* bottom */ line(30,  550,   350, 550);
  /* right */  line(350, 550,   350, 50);
  
  // upper border of the space to throw
  line(30, 300, 350, 300);  
  drawHoles();
}

void drawBall(Color c) {  
  if (!threw) 
    drawCircle(c, new Point(mouseX, mouseY), ballRadius);
  else {
    drawCircle(c, landingPosition, ballRadius); 
    drawThrowingLine();
  }
}

void drawUIText() {
  drawText(Color.BLACK, 30, "Kneipenolympiade", new Point(190, 40));
  drawText(Color.BLACK, 15, String.valueOf("Score: " + score), new Point(50, 590));
  drawText(Color.BLACK, 15, String.valueOf("Versuche: " + versuche), new Point(325, 590));
  drawText(Color.BLACK, 15, String.valueOf("Wurfstärke: " + throwPower), new Point(200, 590));
}

void drawThrowingLine() {
  line(releasePosition.x, releasePosition.y, landingPosition.x, landingPosition.y);
}
