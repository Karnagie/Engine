interface IGameObject{
  
  public Transform transform = null;
  
  public Image image = null;
  
  public void use();
  
}

interface ITransform{
  
  public Vector position = new Vector();
  
  public Vector rotation = new Vector();
  
  public float distance = 0;
  
  
  
  public void smoothDamp(Vector target, float speed);
  
  public boolean triggered(Transform target);
  
  public void smoothRotate(Vector target, float speed);
}

interface IImage{
  
  public PImage image = new PImage();
  public PShape shape = new PShape();
  
  float[][] vertexes = new float[4][4];
  
  public Transform transform = null;
  
  public Vector size = null;
  
  public void setImage(String image);
  
  public void makeImage();
  
  public void setShape(String shape);
  
  public void drawImage();
  
  public void makeVertex();
  
}