import themidibus.*;
MidiBus myBus;
int len=100, x1=0, y1=len, x2=len/2, y2=0, x3=len, y3=len, x=int(random(0, len)), y=int(random(0, len)), rand, count, count2;

void setup() {
  size(100, 127);
  MidiBus.list();
  myBus = new MidiBus(this, 0, 2); 
  background(0);
  stroke(255);
}


void draw() {
  if (frameCount<30) {
    for (int i=0; i<1000; i++) {
      rand=int(random(0, 3));
      switch(rand) {
      case 0:
        x=(x+x1)/2;
        y=(y+y1)/2;
        break;
      case 1:
        x=(x+x2)/2;
        y=(y+y2)/2;
        break;
      case 2:
        x=(x+x3)/2;
        y=(y+y3)/2;
        break;
      }
      point(x, y);
    }
  } else {
    if (count2==0) {
      for (int i=0; i<127; i++) {
        if (get(count, i)== -1) {
          myBus.sendNoteOn(144, i, 127);
          set(count, i, color(0, 0, 255));
        }
      }
      //count=(count+1)%width;
      if (count<width) count++;
    }
  }
  count2=(count2+1)%10;
}
