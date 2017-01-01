// Alex Woodcroft
// http://newvoxel.com
// Code sourced from Daniel Shiffman at http://codingrainbow.com some modifications may have been made

//Box class used so I can actually get reference of the boxes I draw on screen since apparently Processing doesn't already have them as a class. STUPID I KNOW

class Box {
  //Give each box a position and radius
  PVector pos;
  float r;
  
  //Constructor to create box with specified variables
  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }
  
  
  void show() {
    //push and pop matrix needed use computers co-ordinate system in a human friendly interface
    //basically just sets it up a Cartesian coordinate system  that I'm familiar with I think
    pushMatrix();
    //IMPORTANT: Move the draw location before drawing the box or they will all be in the same position
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
  
  ArrayList<Box> generate() {
    //Divide cube into 27 segments and place new cubes in the desired places it's easier than it looks at first glance
    ArrayList<Box> boxes = new ArrayList<Box>();
    for(int x = -1; x < 2; x++) {
      for(int y = -1; y < 2; y++) {
        for(int z = -1; z < 2; z++) {
          if((x == 0 && y == 0) || (x == 0 && z == 0) || (y == 0 && z == 0))  {
            //Do nothing
          } else {
            float newR = r/3;
            Box b = new Box(pos.x+x*newR, pos.y+y*newR, pos.z+z*newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }
}