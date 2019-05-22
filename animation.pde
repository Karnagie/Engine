class AnimationController{
  //Animate gameObject or not
  public boolean animate = false;
  //Set default animation if stoped animation
  public boolean defaultAnim = true;
  
  private float milliseconds;
  
  private ArrayList<Animation> animations = new ArrayList<Animation>();
  
  private Animation currentAnimation;
  
  public AnimationController(){
    this.milliseconds = 0;
  }
  
  public void setAnimation(Animation anim){
    this.currentAnimation = anim;
  }
  public void setAnimation(int id){
    this.currentAnimation = animations.get(id);
  }
  
  String animate(){
    if(this.currentAnimation == null){
      this.currentAnimation = this.find("default");
    }
    
    if(milliseconds>=millis()){
      //animate
      return this.currentAnimation.frames.get(this.currentAnimation.currentFrame).image;
    }else{
      //new animation
      milliseconds = millis()+this.currentAnimation.frames.get(this.currentAnimation.currentFrame).time;
      this.currentAnimation.currentFrame += 1;
      this.currentAnimation.currentFrame %= this.currentAnimation.frames.size();
      return this.currentAnimation.frames.get(this.currentAnimation.currentFrame).image;
    }
  }
  void setAnimation(String animation){
    if(find(animation)!=null) this.currentAnimation = this.find(animation);
    else this.currentAnimation = this.find("default");
  }
  
  Animation find(String name){
    for(int i = 0; i < animations.size(); i++){
      if(animations.get(i).name == name) return animations.get(i);
    }
    return null;
  }

  public void addAnimation(Animation anim){
    this.animations.add(anim);
  }
  public void addAnimation(String name, String image, int millis){
    Animation anim = new Animation(name, image, millis);
    this.animations.add(anim);
  }
}

class Animation{
  
  ArrayList<Frame> frames = new ArrayList<Frame>();
  
  public String name;
  
  int currentFrame;
  
  public Animation (){
  }
  public Animation (String name){
    this.name = name;
  }
  public Animation (String name, String image, int milliseconds){
    this.name = name;
    addFrame(image, milliseconds);
    //this.frames.add(frame);
  }
  
  public void addFrame(String image, int time){
   // images.add(image);
   // times.append(time);
     Frame frame = new Frame(image, time);
     this.frames.add(frame);
  }
}

class Frame{
  String image;
  float time;
  
  public Frame(String image, int time){
    this.image = image;
    this.time  = time;
  }
}