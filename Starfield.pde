Particle[] parts = new Particle[200];
void setup()
{
	size(500, 500);
	for(int i = 0; i < parts.length; i++)
	{
		parts[i] = new Particle();
	}
	parts[0] = new OddballParticle();
	frameRate(10);
}
void draw()
{
	background(0);
	for(int i = 0; i < parts.length; i++)
	{
		parts[i].move();
		parts[i].show();
	}
}
class Particle
{
	double x, y, mySpeed, myAngle;
	int myColor;

	Particle()
	{
		x = 250;
		y = 250;
		mySpeed = Math.random()*3+0.5;
		myAngle = Math.random()*2*Math.PI; 
		myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
	}
	void move()
	{
		x += Math.cos(myAngle) * mySpeed;
		y += Math.sin(myAngle) * mySpeed;
	}
	void show()
	{
		fill(myColor);
		ellipse((float)x, (float)y, 10, 10);
	}
}

class OddballParticle extends Particle
{
	void show()
	{
		fill(256,256,0);
		beginShape();
		vertex((float)x-10, (float)y);
		vertex((float)x+10, (float)y);
		vertex((float)x-5, (float)y+8);
		vertex((float)x, (float)y-8);
		vertex((float)x+5, (float)y+8);
		endShape();
	}
}


