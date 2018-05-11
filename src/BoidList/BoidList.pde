
class BoidList
{
  ArrayList<PVector> obs;
  ArrayList boids; //will hold the boids in this BoidList
  float h; //for color
  
  BoidList(int n,float ih)
  {
    boids = new ArrayList();
    obs = new ArrayList<PVector>();
    h = ih;
    for(int i=0;i<n;i++)
      boids.add(new Boid());
  }
  
  void add()
  {
    boids.add(new Boid());
  }
  
  void addBoid(Boid b)
  {
    boids.add(b);
  }
  
  void remove()
  {
    boids.remove(boids.size()-1);
  }
  
  void addObs(float x,float y,float z)
  {
    obs.add(new PVector(x,y,z));
  }
  
  void removeObs()
  {
    obs.remove(obs.size()-1);
  }
  
  void run(boolean aW,float ali,float coh,float sep)
  {
    for(int i=0;i<boids.size();i++) //iterate through the list of boids
    {
      Boid tempBoid = (Boid)boids.get(i); //create a temporary boid to process and make it the current boid in the list
      tempBoid.h = h;
      tempBoid.avoidWalls = aW;
      tempBoid.obs = obs;
      tempBoid.run(boids,ali,coh,sep); //tell the temporary boid to execute its run method
    }
    for (int i=0;i<obs.size();i++)
    {
      PVector pos = obs.get(i);
      pushMatrix();
      fill(#FF0000);
      translate(pos.x, pos.y, pos.z);
      sphere(15);
      popMatrix();
    }
  }
}
