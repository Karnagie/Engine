class GameObject implements IGameObject{
  // array with components
  private float sizeW;
  
  public Transform transform = new Transform();
  
  private Image image;
  
  public AnimationController animation;
  
  public GameObject(){
    float w = width;
    sizeW = w/1080;
    
    this.transform = new Transform();
    this.image = new Image();
    this.animation = new AnimationController();
    this.animation.addAnimation("default", this.image.name, 1000);
  }
  public GameObject(Transform transform){
    float w = width;
    sizeW = w/1080;
    
    this.transform = transform;
    this.transform.position = new Vector(this.transform.position.x*sizeW, this.transform.position.y*sizeW);
    //this.transform.position.y = this.transform.position.y*size;
    
    //this.animation = new AnimationController();
   // this.animation.addAnimation("default", this.image.name, 1000);
  }
  public GameObject(Transform transform, String image, Vector size){
    float w = width;
    sizeW = w/1080;
    
    this.transform = transform;
    this.transform.position = new Vector(this.transform.position.x*sizeW, this.transform.position.y*sizeW);
    
    this.image = new Image(image, size);
    this.animation = new AnimationController();
    this.animation.addAnimation("default", this.image.name, 1000);
  }
  public GameObject(Transform transform, Image image){
    float w = width;
    sizeW = w/1080;
    
    this.transform = transform;
    this.transform.position = new Vector(this.transform.position.x*sizeW, this.transform.position.y*sizeW);
    
    this.image = image;
    this.animation = new AnimationController();
    this.animation.addAnimation("default", this.image.name, 1000);
  }
  
  public void use(){
   if(image!=null){
     image.transform.rotation = transform.rotation;
     image.transform.position = transform.position;
   
     if(animation.animate)image.setImage(animation.animate());
     else if(animation.defaultAnim){
       animation.setAnimation("default");
       image.setImage(animation.animate());
     }
     image.drawImage();
     // shape(shape, transform.position.x, transform.position.y);
   }
  }
  
  public void target(Vector target){
    if(Vector.Distance(transform.position, target)>1){
      float i = transform.rotation.angle(transform.position, target);
      transform.rotation.euler(i-90, 0, 0, 100);
      transform.smoothDamp(target, 10);
    }
  }
  
}
