// Alex Woodcroft
// http://newvoxel.com
// Code sourced from Daniel Shiffman at http://codingrainbow.com some modifications may have been made

//This program creates a simulation of a menger sponge fractal that divides itself into a multiple of 20 more cubes per mouse click

//Variables used to control rotation of cube to show off all angles
float aX = 0f;
float aY = 0f;
float aZ = 0f;

//Arraylist used to store all current boxes in simulation
ArrayList<Box> sponge;
Box b;


void setup() {
  //Set size of window and set it to display 3D objects
  size(500,500, P3D);
  //To start off add one box to the array list
  sponge = new ArrayList<Box>();
  b = new Box(0,0,0,200);
  sponge.add(b);
}

//For every box currently in the arraylist generate approximately 20 more boxes to take its place on mouse click
void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for(Box b : sponge) {
    next.addAll(b.generate());
  }
  sponge = next;
}

void draw() {
  //set background to grey
  background(51);
  //remove outlines from boxes
  noStroke();
  //set box colour to yellow
  fill(255,255,0);
  //add lights to the render
  lights();
  
 //set the 0,0 co-ordinates of the screen to be in the center of the window
  translate(width/2, height/2);
  //rotate the camera along all axis at different speeds
  aX += 0.01;
  aY += 0.02;
  aZ += 0.03;
  rotateX(aX);
  rotateY(aY);
  rotateZ(aZ);
  //Show all the boxes in our array
  for(Box b : sponge) {
    b.show();
  }
}