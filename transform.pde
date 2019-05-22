class Transform implements ITransform{
  
  public Vector position;
  
  public Quaternion rotation = new Quaternion();
  
  public float distance;
  
  public Transform(){
    this.position = Vector.zero();
    this.rotation = Quaternion.zero();
    this.distance = 0;
  }
  public Transform(Vector position){
    this.position = position;
    this.rotation = Quaternion.zero();
    this.distance = 0;
  }
  public Transform(Vector position, Quaternion rotation){
    this.position = position;
    this.rotation = rotation;
    this.distance = 0;
  }
  public Transform(Vector position, Quaternion rotation, float distance){
    this.position = position;
    this.rotation = rotation;
    this.distance = distance;
  }
  public Transform(Vector position, float distance){
    this.position = position;
    this.rotation = Quaternion.zero();
    this.distance = distance;
  }
  
  
  
  public void smoothDamp(Vector target, float speed){
    this.position.x = Vector.smoothDamp(
      this.position.x,
      target.x,
      speed
    );
    this.position.y = Vector.smoothDamp(
      this.position.y,
      target.y,
      speed
    );
  }
 
  
  public boolean triggered(Transform target){
    
    if(Vector.Distance(this.position , target.position)<=this.distance){
      return true;
    }
    
    return false;
  }
  
  public void smoothRotate(Vector target, float speed){
    float angle = rotation.angle(position, target);
    rotation.euler(angle,0,0,speed);
  } 
}

