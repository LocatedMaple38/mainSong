//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

boolean playTF = false;
boolean repeatTF = false;
boolean reapet1TF = false;
boolean shuffelTF = false;
boolean FFTF = false;
boolean FRTF = false;
boolean nextTF = false;
boolean prevTF = false;

int numbSongs = 3;
int numbEff = 0;

PImage repeat, repeat1, play, paws, skip, prev, shuffel, fasrFowerd, fastRewind;

float xLoop, yLoop, widthLoop, heightLoop;
float xStart, yStart, widthStart, heightStart;
float xStop, yStop, widthStop, heightStop;
float xskip, yskip, widthskip, heightskip;
float xprev, yprev, widthprev, heightprev;
float xshuffel ,yshuffel, widthshuffel, heightshuffel;
float xFF, yFF, widthFF, heightFF;
float xFR, yFR, widthFR, heightFR;
//
//Global Variables
Minim minim; //creates object to access all functions
AudioPlayer[] song = new AudioPlayer[numbSongs]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioMetaData[] songMetaData = new AudioMetaData[numbSongs]; //Stores everything from PlayList Properties TAB (.mp3)
PFont generalFont;
color purple = #2C08FF;

int appWidth, appHeight;

void setup() {
  size(600, 600, P3D);
  appWidth = width;
  appHeight = height;
  //Display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String BYC = "Beat_Your_Competition";
  String extension1 = ".mp3";
  String pathway = "../adio/"; //Relative Path
  String path = sketchPath( pathway + BYC + extension1); //Absolute Path
  
  String image = "../images/";
  String extension2 = ".png";
  
  // See: https://poanchen.github.io/blog/20[0]6/[0][0]/[0]5/how-to-add-background-music-in-processing-3.0
  println(path);
  song[0] = minim.loadFile( path);
  songMetaData[0] = song[0].getMetaData();
  generalFont = createFont ("Harrington", 55); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  //song[0].loop(0);
  //
  //Meta Data Println Testing
  //For Prototyping, print all information to the console first
  //Verifying Meta Data, [0]8 println's 
  //Repeat: println("?", songMetaData[0].?() );
  println("File Name", songMetaData[0].fileName() ); //Data Correct, Verified in Console
  //Must use pure Java at OS Level to list fileName before loading Playlist
  println("Song Length (in milliseconds)", songMetaData[0].length() );
  println("Song Length (in seconds)", songMetaData[0].length()/1000 ); 
  println("Song Length (in minutes & seconds)", songMetaData[0].length()/1000/60, "minutes", ( songMetaData[0].length()/1000 - ( songMetaData[0].length()/1000/60)*60 ), "seconds" ); //Gets Formula
  println("Song Title", songMetaData[0].title() );
  println("Author", songMetaData[0].author() );
  println("Composer", songMetaData[0].composer() );
  println("Orchestra", songMetaData[0].orchestra() );
  println("Album", songMetaData[0].album() );
  println("Disk", songMetaData[0].disc() );
  println("Publisher", songMetaData[0].publisher() );
  println("Date Released", songMetaData[0].date() );
  println("Copyright", songMetaData[0].copyright() );
  println("Comments", songMetaData[0].comment() );
  println("Lyrics", songMetaData[0].lyrics() ); //OPTIONAL: Music App Sing Along
  println("Track", songMetaData[0].track() );
  println("Genre", songMetaData[0].genre() );
  println("Encoded", songMetaData[0].encoded() );
  
xLoop = appWidth*0;
yLoop = appHeight*0;
widthLoop = appWidth*1/5;
heightLoop = appHeight*1/5;
repeat1 = loadImage(image + "reapet1" + extension2);
repeat = loadImage(image + "reapet" + extension2);

xStart = appWidth*1/5;
yStart = appHeight*0;
widthStart = appWidth*1/5;
heightStart = appHeight*1/5;
play = loadImage(image + "play" + extension2);

xStop = appWidth*1/5;
yStop = appHeight*0;
widthStop = appWidth*1/5;
heightStop = appHeight*1/5;
paws = loadImage(image + "paws" + extension2);

xskip = appWidth*2/5;
yskip = appHeight*0;
widthskip = appWidth*1/5;
heightskip = appHeight*1/5;
skip = loadImage(image + "skip" + extension2);

xprev = appWidth*3/5;
yprev = appHeight*0;
widthprev = appWidth*1/5;
heightprev = appHeight*1/5;
prev = loadImage(image + "prev" + extension2);

xshuffel = appWidth*4/5;
yshuffel = appHeight*0;
widthshuffel = appWidth*1/5;
heightshuffel = appHeight*1/5;
shuffel = loadImage(image + "shuffel" + extension2);

xFF = appWidth*1/4;
yFF = appHeight*1/5;
widthFF = appWidth*1/5;
heightFF = appHeight*1/5;
fasrFowerd = loadImage(image + "fasrFowerd" + extension2);

xFR = appWidth*2/4;
yFR = appHeight*1/5;
widthFR = appWidth*1/5;
heightFR = appHeight*1/5;
fastRewind = loadImage(image + "fastRewind" + extension2);

} //End setup
//
void draw() {
  rect1();
  //NOte: Looping Function
  //Note: logical operators could be nested IFs
  if ( song[0].isLooping() && song[0].loopCount()!=-1 );
  if ( song[0].isLooping() && song[0].loopCount()==-1 );
  if ( song[0].isPlaying() && !song[0].isLooping() );
  //
  //Debugging Fast Forward and Fast Rewind  //
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song[0].play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  //.play() includes .rewind()
  //
  if ( key>='1' || key<='9' ) { //Loop Button, previous (key=='[0]' || key=='9')
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    String keystr = String.valueOf(key);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song[0].loop(loopNum); //Parameter is number of repeats
    //
  }
  if ( key=='L' || key=='l' ) song[0].loop(); //Infinite Loop, no parameter OR -[0]
  //
  if ( key=='M' || key=='m' ) { //MUTE Button
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( song[0].isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      song[0].unmute();
    } else {
      //Possible ERROR: Might rewind the song
      song[0].mute();
    }
  } //End MUTE
  //
  //Possible ERROR: FF rewinds to parameter milliseconds from SONG Start
  //Possible ERROR: FR rewinds to parameter milliseconds from SONG Start
  //How does this get to be a true ff and fr button
  //Actual .skip() allows for varaible ff & fr using .position()+-
  if ( key=='F' || key=='f' ) song[0].skip( 0 ); //SKIP forward [0] second ([0]000 milliseconds)
  if ( key=='R' || key=='r' ) song[0].skip( 1000 ); //SKIP  backawrds [0] second, notice negative, (-[0]000 milliseconds)
  //
  //Simple STOP Behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
  if ( key=='S' | key=='s' ) {
    if ( song[0].isPlaying() ) {
      song[0].pause(); //auto .rewind()
    } else {
      song[0].rewind(); //Not Necessary
    }
  }
  //
  //Simple Pause Behaviour: .pause() & hold .position(), then PLAY
  if ( key=='Y' | key=='y' ) {
    if ( song[0].isPlaying()==true ) {
      song[0].pause(); //auto .rewind()
    } else {
      song[0].play(); //ERROR, doesn't play
    }
  }
} //End keyPressed
//
void mousePressed() {
  if(repeatTF == false && mouseX>xLoop && mouseX<xLoop+widthLoop && mouseY>yLoop && mouseY<yLoop+heightLoop){
    repeatTF = true;
  }else if(repeatTF == true){
    repeatTF = false;
    reapet1TF = true;
  }else if(reapet1TF == true){
    reapet1TF = false;
  }
} //End mousePressed
//
//End MAIN Program
