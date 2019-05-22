class Image implements IImage{
  
  public PImage image = new PImage();
  public PShape shape = new PShape();
  
  float[][] vertexes = new float[4][4];
  
  public Transform transform = new Transform();
  
  public Vector size = Vector.zero();
  
  public String name = "";
  
  public Image(){
    this.size = Vector.zero();
    this.transform = new Transform();
    this.name = "default";
    makeImage();
  }
  public Image(String image, float x, float y){
    this.transform = new Transform();
    this.image = loadImage(image);
    this.name = image;
    this.size = new Vector(x,y);
    makeImage();
  }
  public Image(String image, Vector size){
    this.transform = new Transform();
    this.image = loadImage(image);
    this.name = image;
    this.size = size;
    makeImage();
  }
  public Image(String image, Transform transform){
    this.transform = transform;
    this.image = loadImage(image);
    this.name = image;
    this.size = Vector.zero();
    makeImage();
  }
  public Image(String image, Vector size, Transform transform){
    this.transform = transform;
    this.image = loadImage(image);
    this.name = image;
    this.size = size;
    makeImage();
  }
  
  
  
  public void setImage(String image){
    this.image = loadImage(image);
    this.name = image;

    this.shape.beginShape();
    this.shape.texture(this.image);
    this.shape.endShape();
  }
  
  public void makeImage(){
    
    makeVertex();
    
    this.shape = createShape();
    
    this.shape.beginShape();
    this.shape.noStroke();
    this.shape.texture(this.image);
    //this.shape.fill(0,200,0);
    this.shape.vertex(
      vertexes[0][0],
      vertexes[0][1],
      vertexes[0][2],
      vertexes[0][3]);
    this.shape.vertex(
      vertexes[1][0],
      vertexes[1][1],
      vertexes[1][2],
      vertexes[1][3]);
    this.shape.vertex(
      vertexes[2][0],
      vertexes[2][1],
      vertexes[2][2],
      vertexes[2][3]);
    this.shape.vertex(
      vertexes[3][0],
      vertexes[3][1],
      vertexes[3][2],
      vertexes[3][3]);
    this.shape.endShape();
      
  }
  
  public void setShape(String shape){
    this.shape = loadShape(shape);
  }
  
  public void drawImage(){
    if(this.transform.rotation.x != this.transform.rotation._x){
      this.shape.rotate((radians(this.transform.rotation._x)-radians(this.transform.rotation.x))*-1);
      
      this.transform.rotation._x = this.transform.rotation.x;
    }
    
    shape(
      this.shape, 
      transform.position.x, 
      transform.position.y
    );
  }
  
  public void makeVertex(){
    float w = width;
    
    vertexes[0][0] = size.x/2*(w/1080);
    vertexes[0][1] = size.y/2*(w/1080);
    vertexes[0][2] = size.x;//*(w/1080);
    vertexes[0][3] = size.y;//*(w/1080);
    
    vertexes[1][0] = -size.x/2*(w/1080);
    vertexes[1][1] = size.y/2*(w/1080);
    vertexes[1][2] = 0;
    vertexes[1][3] = size.y;//*(w/1080);
    
    vertexes[2][0] = -size.x/2*(w/1080);
    vertexes[2][1] = -size.y/2*(w/1080);
    vertexes[2][2] = 0;
    vertexes[2][3] = 0;
    
    vertexes[3][0] = size.x/2*(w/1080);
    vertexes[3][1] = -size.y/2*(w/1080);
    vertexes[3][2] = size.x;//*(w/1080);
    vertexes[3][3] = 0;
  }
  
}
