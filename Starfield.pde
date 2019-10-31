Particle[] parts = new Particle[200];
void setup()
{
	size(500, 500);
	for(int i = 0; i < parts.length; i++)
	{
		parts[i] = new Particle();
	}
	parts[0] = new OddballParticle();
	
}
void draw()
{
	for(int i = 0; i < parts.length; i++)
	{
		parts[i].move();
		parts[i].show();
	}
	fill(255, 255, 255, 5);
	stroke(0, 0, 0, 5);
	rect(0, 0, 500, 500);
}
class Particle
{
	double x, y, mySpeed, myAngle;
	int myColor;

	Particle()
	{
		x = Math.random()*500;
		y = Math.random()*500;
		mySpeed = Math.random()*5;
		myAngle = Math.random()*2*Math.PI; 
		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	void move()
	{
		if(y > 500){
			myAngle = (2*Math.PI - myAngle);
		}
		if(y < 0){
			myAngle = (2*Math.PI - myAngle);
		}
		if(x > 500){
			myAngle = (Math.PI - myAngle);
		}
		if(x < 0){
			myAngle = (Math.PI - myAngle);
		}
		x += Math.cos(myAngle) * mySpeed;
		y += Math.sin(myAngle) * mySpeed;
	}
	void show()
	{
		fill(myColor);
		ellipse((float)x, (float)y, 5, 5);
	}
}

class OddballParticle extends Particle
{
	void show()
	{
		fill(myColor);
		rect((float)x-25, (float)y-25, 25, 25);
	}
}
void mousePressed(){
	frameRate(120);
}
void mouseReleased() {
	frameRate(60);
}

