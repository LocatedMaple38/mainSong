//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
//
float xLoop, yLoop, widthLoop, heightLoop;
float xLoop1, yLoop1, widthLoop1, heightLoop1;
float xStart, yStart, widthStart, heightStart;
float xStop, yStop, widthStop, heightStop;
float xskip, yskip, widthskip, heightskip;
float xprev, yprev, widthprev, heightprev;
float xshuffel ,yshuffel, widthshuffel, heightshuffel;
float xFF, yFF, widthFF, heightFF;
float xFR, yFR, widthFR, heightFR;

PImage fastRewind, paws, fasrFowerd, play, prev, repeat, repeat1, shuffel, skip;

int appWidth, appHeight;

void setup() {
  size(500, 500);
  appWidth = width;
  appHeight = height;
  //Display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String groove = "groove";
  String extension = ".mp3";
  String pathwayAdio = "FreeWare Music/MusicDownload/"; //Relative Path
  String pathAdio = sketchPath( pathwayAdio + groove + extension ); //Absolute Path
  // See: https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
  println(pathAdio);
  song1 = minim.loadFile( pathAdio );
  //song1.loop(0);
  

xLoop = appWidth*0;
yLoop = appHeight*0;
widthLoop = appWidth*1/4;
heightLoop = appHeight*1/4;
repeat = loadImage("images/repeat.png");

xLoop1 = appWidth*0;
yLoop1 = appHeight*0;
widthLoop1 = appWidth*1/4;
heightLoop1 = appHeight*1/4;
repeat1 = loadImage("images/repeat1.png");

xStart = appWidth*1/4;
yStart = appHeight*0;
widthStart = appWidth*1/4;
heightStart = appHeight*1/4;
play = loadImage("images/play.png");

xStop = appWidth*1/4;
yStop = appHeight*0;
widthStop = appWidth*1/4;
heightStop = appHeight*1/4;
paws = loadImage("images/paws.png");

xFF = appWidth*2/4;
yFF = appHeight*0;
widthFF = appWidth*1/4;
heightFF = appHeight*1/4;
fasrFowerd = loadImage("images/fasrFowerd.png");

xFR = appWidth*0;
yFR = appHeight*1/4;
widthFR = appWidth*1/4;
heightFR = appHeight*1/4;
fastRewind = loadImage("images/fastRewind.png");

xskip = appWidth*1/4;
yskip = appHeight*1/4;
widthskip = appWidth*1/4;
heightskip = appHeight*1/4;
skip = loadImage("images/skip.png");

xprev = appWidth*2/4;
yprev = appHeight*1/4;
widthprev = appWidth*1/4;
heightprev = appHeight*1/4;
prev = loadImage("image/prev.png");

xshuffel = appWidth*3/4;
yshuffel = appHeight*1/4;
widthshuffel = appWidth*1/4;
heightshuffel = appHeight*1/4;
shuffel = loadImage("image/shuffel.png");

} //End setup
//
void draw() {
  rect1();
}
//
void keyPressed() {
  if ( key >='1' || key <='9' ) { //Loop Button
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    String keystr = String.valueOf(key);
    println(keystr);
    int loopNum = int(keystr);
    song1.loop(loopNum); //Parameter is number of repeats
    // 
  }
  if (key == CONTROL && key=='L' || key == CONTROL && key=='l') song1.loop(); //Infinite Loop, no parameter OR -1
 
  if(key == CONTROL && key == 'm' || key == 'M'){
    if(song1.isMuted() ){
      song1.unmute();
    }else{
       song1.mute();
    }
  }
  if(key == SHIFT && key == LEFT || key == RIGHT){
    if(key == LEFT){
      song1.skip(+5000);
    }
    if(key == RIGHT){
      song1.skip(+-5000);
    }
  }
  if(key == CONTROL && key == UP || key == DOWN){
    if(key == UP){
      
    }
    if(key == DOWN){
      
    }
  }
  if(key == CONTROL && key==' ' && song1.isPlaying()){
    song1. pause();
  }else{
    song1.play();
  }
  if(key == CONTROL && key == LEFT){
    if(key == LEFT){
       
    }
    if(key == RIGHT){
      
    }
  }
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
