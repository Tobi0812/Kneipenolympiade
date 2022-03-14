// whhere the mouse gets pressed, used for calculating the landing position
Point pressPosition;
Point releasePosition;

Point landingPosition;
int[] v = {0, 0}; //ThrowVector
float[] w = {0, 0}; //new calculated vector

boolean threw = false;
boolean drawThrowLine = false;

int versuche = 10;

int score;

int throwPower = 100;
float throwPowerCalc = 1;

int pointsToWin = 100;
int ballRadius = 24;

  
/*
Calculates the distance between two given points.
*/
double calculateDistance(Point p1, Point p2) {
   return Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2)); 
}

Point getLandingPoint() {
  throwPowerCalc = throwPower / 100;
  
  //Vector Throw
  v[0] = releasePosition.x - pressPosition.x;
  v[1] = releasePosition.y - pressPosition.y;
  //Scalarmultiplication using throwPower
  w[0] = v[0] * throwPowerCalc;
  w[1] = v[1] * throwPowerCalc;
  
  //wall collision
  Point landingPoint = new Point((int) (releasePosition.x + w[0]), (int) (releasePosition.y + w[1]));
  if (landingPoint.y < 50) {
    landingPoint.y += 2 * (50 - landingPoint.y);
  }
  
  //return the new landing point
  return landingPoint;
}


void mousePressed() {
  pressPosition = new Point(mouseX, mouseY);
  drawThrowLine = true;
}

void mouseReleased() {
  releasePosition = new Point(mouseX, mouseY);
  threw = true;
  versuche--;
  boolean invalidThrow = failCheck();
  if (!invalidThrow) {
    landingPosition = getLandingPoint();
    for(int i = 0; i < holes.length; i++) {
      if (ballHit(landingPosition, holes[i].point, ballRadius, holes[i].radius)) {
        //console.clear();
        //println("hit");
        //println(holes[i].width_height);
        
        //println(calculateDistance(landingPosition, holes[i].point));
        //println(landingPosition.x, landingPosition.y, 24);
        //println(holes[i].point.x, holes[i].point.y, holes[i].radius);
        score += holes[i].scoring;
        scoreSFX.play();
        //break;
      }
    }
    
  }  
  drawThrowLine = false;
  if (versuche == 0) {
    backgroundMusic.stop();
    boolean won = score >= pointsToWin;
    if (won) victorySFX.play();
    else loseSFX.play();
    javax.swing.JOptionPane.showMessageDialog(null, "Sie haben alle Versuche beendet! Ihre Punktzahl: " + score, won ? "Glückwunsch!" : "Loser!", javax.swing.JOptionPane.INFORMATION_MESSAGE); 
    System.exit(0);
  }
}

void keyPressed() {
    if (String.valueOf(key).equalsIgnoreCase("n")) {
      threw = false;
      drawThrowLine = false;
    }
    if (key == '+') throwPower += 1;
    if (key == '-') throwPower -= 1;
    
    if(throwPower < 1) throwPower = 1;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e == -1) // up
    throwPower += 1;
  else if (e == 1) // down
    throwPower -= 1;
    
    
  if (throwPower < 1) throwPower = 1;
}

/*
checks if the mouse crossed the line so it will invalid
*/
boolean failCheck() {
  if(mouseY < 300) {
      javax.swing.JOptionPane.showMessageDialog(null, "Sie haben die Linie mit der Maus überschritten!", "Ungültiger Wurf!", javax.swing.JOptionPane.INFORMATION_MESSAGE);
      score -= 30;
      if (score < 0) score = 0;
      threw = false;
      return true;
  }
  return false;
}

boolean ballHit(Point ball, Point hole, int radius_ball, int radius_hole) {
  double distanceHoleBall = calculateDistance(ball, hole);
  
  if (distanceHoleBall < radius_ball + radius_hole) {
    //println(ball.x, ball.y);
    //println(hole.x, hole.y);
    //println("Distanz: ", distanceHoleBall, " | Radius Ball: ", radius_ball, " | Radius Loch: " + radius_hole);
    return true;
  }
  return false;
}
