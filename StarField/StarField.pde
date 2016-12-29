// Alex Woodcroft
// http://newvoxel.com
// Code sourced from Daniel Shiffman at http://codingrainbow.com some modifications may have been made

//This program is designed to simulate the visuals of going through space at "warp speed"


Star[] stars = new Star[800];

float starSpeed;

void setup() {
  //Set size of window
  size(600,600);
  //Fill stars array with Star objects
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  //Map star speed to distance mouse cursor is from left side of window
  starSpeed = map(mouseX, 0, width, 0, 50);
  //Set background colour to black
  background(0,0,0);
  //Set starting location of screen to be the center instead of the top left
  translate(width/2, height/2);
  for(int i = 0; i < stars.length; i++) {
    //stars[i].Update();
    //stars[i].Show();
  }
}