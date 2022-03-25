import processing.sound.SoundFile;

SoundFile scoreSFX;
SoundFile backgroundMusic;
SoundFile victorySFX;
SoundFile loseSFX;

PImage background = new PImage();

void setup() {
  surface.setTitle("Kneipenolympiade");
  smooth();
  loadPixels();
  thread("loadAssets");
}

void loadAssets() {
  background = loadImage("background.jpg");
  scoreSFX = new SoundFile(this, "score SFX.mp3");
  backgroundMusic = new SoundFile(this, "backgroundMusic.mp3");
  victorySFX = new SoundFile(this, "VictorySFX.mp3");
  loseSFX = new SoundFile(this, "loseSFX.mp3");
  backgroundMusic.loop();
}

public void settings() {
  size(400, 600);
}

void draw()  {
  background(Color.GRAY);
  image(background, 0, 0);
  drawField();
  drawUIText();
  drawBall(Color.RED);
  if(pressPosition != null && !threw && drawThrowLine) {
    line(pressPosition.x, pressPosition.y, mouseX, mouseY);
  }
}
