
// change zero types - need to make it functions!

static class Vector {
  public float x;
  public float y;

  public Vector(Vector v) {
    x = v.x;
    y = v.y;
  }

  public Vector(float _x, float _y) {
    x = _x;
    y = _y;
  }

  public Vector() {
    x=0;
    y=0;
  }

  static Vector zero () {
    return new Vector(0, 0);
  }

  static float smoothDamp(float position, float target, float speed) {
    return lerp(position, target, speed/100);
  }

  static float Distance(Vector a, Vector b) {
    float d = sqrt(sq(b.x-a.x)+sq(b.y-a.y));
    return d;
  }
}

static class Quaternion {

  int quarter = 0;

  public float x;
  public float y;
  public float z;

  public float _x;
  public float _y;
  public float _z;


  public Quaternion(Quaternion v) {
    x = v.x;
    y = v.y;
    z = v.z;
  }
  public Quaternion(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
  }
  public Quaternion() {
    x=0;
    y=0;
    z=0;
  }




  static Quaternion zero() {
    return new Quaternion(0, 0, 0);
  }

  void euler(float _x1, float _y1, float _z1, float speed) {

    float thisX = x;
    float thisY = y;
    float thisZ = z;


    x = lerp(thisX, _x1, speed/100);
    y = lerp(thisY, _y1, speed/100);
    z = lerp(thisZ, _z1, speed/100);
  }

  float angle(Vector a, Vector b) {

    float bc = abs(a.y-b.y);
    float ab = abs(a.x-b.x);


    float angle = atan(bc/ab);
    //if (abs(abs(a.x-b.x)-100)<=45&&
     //   abs(abs(a.y-b.y)-100)<=45) return x;
    if(Vector.Distance(a, b)<1){
      return x;
    }

    // 1 0-90
    if (b.x>=a.x && b.y<=a.y) {
      switch(quarter%4) {
      case 0:
        //
        break;
      case 1:
        quarter -= 1;
        break; 
      case 2:
        quarter -= 2;
        break; 
      case 3:
        quarter += 1;
        break; 


      case -1:
        quarter += 1;
        break;
      case -2:
        quarter -= 2;
        break; 
      case -3:
        quarter -= 1;
        break;
      }
      return (quarter+1)*90-degrees(angle);
    }

    // 2 270-360
    if (b.x>=a.x && b.y>=a.y) {
      switch(quarter%4) {
      case 0:
        if (quarter >=0) {
          quarter += 1;
        } else quarter += 1;
        break;
      case 1:
        //
        break; 
      case 2:
        quarter -= 1;
        break; 
      case 3:
        quarter -= 2;
        break; 


      case -2:
        quarter -= 1;
        break; 
      case -3:
        //
        break; 
      case -1:
        quarter -= 2;
        break;
      }
      return (quarter)*90+degrees(angle);
    }

    // 3 180-270
    if (b.x<=a.x && b.y>=a.y) {
      switch(quarter%4) {
      case 0:
        if (quarter >=0) {
          quarter += 2;
        } else quarter -=2;
        break;
      case 1:
        quarter += 1;
        break; 
      case 2:
        //
        break; 
      case 3:
        quarter -= 1;
        break; 


      case -1:
        quarter -= 1;
        break;
      case -3:
        quarter += 1;
        break;
      case -2:
        //
        break;
      }
      return (quarter+1)*90-degrees(angle);
    }

    // 4 90-180
    if (b.x<=a.x && b.y<=a.y) {
      switch(quarter%4) {
      case 0:
        if (quarter >=0) {
          quarter -= 1;
        } else quarter -= 1;
        break;
      case 1:
        quarter += 2;
        break; 
      case 2:
        quarter += 1;
        break; 
      case 3:
        //
        break; 


      case -1:
        // 
        break; 
      case -2:
        quarter += 1;
        break; 
      case -3:
        quarter -= 2;
        break;
      }
      return (quarter)*90+degrees(angle);
    }

    return 0;
  }
}
