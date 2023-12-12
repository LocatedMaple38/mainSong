//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage repeat, repeat1, play, paws, skip, prev, shuffel, fasrFowerd, fastRewind;

float xLoop1, yLoop1, widthLoop1, heightLoop1;
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
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioMetaData songMetaData1; //Stores everything from PlayList Properties TAB (.mp3)
PFont generalFont;
color purple = #2C08FF;

int appWidth, appHeight;
//
void setup() {
  size(600, 600, P3D);
  appWidth = width;
  appHeight = height;
  //Display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage
  String groove = "groove";
  String extension1 = ".mp3";
  String pathway1 = "adio"; //Relative Path
  String path1 = sketchPath( pathway1 + groove + extension1); //Absolute Path
  
  String image = "../images/";
  String extension2 = ".png";
  
  // See: https://poanchen.github.io/blog/2016/11/15/how-to-add-background-music-in-processing-3.0
  println(path1);
  song1 = minim.loadFile( path1 );
  songMetaData1 = song1.getMetaData();
  generalFont = createFont ("Harrington", 55); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  //song1.loop(0);
  //
  //Meta Data Println Testing
  //For Prototyping, print all information to the console first
  //Verifying Meta Data, 18 println's 
  //Repeat: println("?", songMetaData1.?() );
  println("File Name", songMetaData1.fileName() ); //Data Correct, Verified in Console
  //Must use pure Java at OS Level to list fileName before loading Playlist
  println("Song Length (in milliseconds)", songMetaData1.length() );
  println("Song Length (in seconds)", songMetaData1.length()/1000 ); 
  println("Song Length (in minutes & seconds)", songMetaData1.length()/1000/60, "minutes", ( songMetaData1.length()/1000 - ( songMetaData1.length()/1000/60)*60 ), "seconds" ); //Gets Formula
  println("Song Title", songMetaData1.title() );
  println("Author", songMetaData1.author() );
  println("Composer", songMetaData1.composer() );
  println("Orchestra", songMetaData1.orchestra() );
  println("Album", songMetaData1.album() );
  println("Disk", songMetaData1.disc() );
  println("Publisher", songMetaData1.publisher() );
  println("Date Released", songMetaData1.date() );
  println("Copyright", songMetaData1.copyright() );
  println("Comments", songMetaData1.comment() );
  println("Lyrics", songMetaData1.lyrics() ); //OPTIONAL: Music App Sing Along
  println("Track", songMetaData1.track() );
  println("Genre", songMetaData1.genre() );
  println("Encoded", songMetaData1.encoded() );
  
xLoop1 = appWidth*0;
yLoop1 = appHeight*0;
widthLoop1 = appWidth*1/4;
heightLoop1 = appHeight*1/4;
repeat1 = loadImage(image + "repeat1" + extension2);

xLoop = appWidth*0;
yLoop = appHeight*0;
widthLoop = appWidth*1/4;
heightLoop = appHeight*1/4;
repeat = loadImage(image + "repeat" + extension2);

xStart = appWidth*2/4;
yStart = appHeight*0;
widthStart = appWidth*1/4;
heightStart = appHeight*1/4;
play = loadImage(image + "play" + extension2);

xStop = appWidth*2/4;
yStop = appHeight*0;
widthStop = appWidth*1/4;
heightStop = appHeight*1/4;
paws = loadImage(image + "paws" + extension2);

xskip = appWidth*3/4;
yskip = appHeight*0;
widthskip = appWidth*1/4;
heightskip = appHeight*1/4;
skip = loadImage(image + "skip" + extension2);

xprev = appWidth*2/4;
yprev = appHeight*0;
widthprev = appWidth*1/4;
heightprev = appHeight*1/4;
prev = loadImage(image + "prev" + extension2);

xshuffel = appWidth*0;
yshuffel = appHeight*1/4;
widthshuffel = appWidth*1/4;
heightshuffel = appHeight*1/4;
shuffel = loadImage(image + "shuffel" + extension2);

xFF = appWidth*1/4;
yFF = appHeight*1/4;
widthFF = appWidth*1/4;
heightFF = appHeight*1/4;
fasrFowerd = loadImage(image + "fasrFowerd" + extension2);

xFR = appWidth*2/4;
yFR = appHeight*1/4;
widthFR = appWidth*1/4;
heightFR = appHeight*1/4;
fastRewind = loadImage(image + "fastRewind" + extension2);

} //End setup
//
void draw() {
  //NOte: Looping Function
  //Note: logical operators could be nested IFs
  if ( song1.isLooping() && song1.loopCount()!=-1 ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isLooping() && song1.loopCount()==-1 ) println("Looping Infinitely");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  //Debugging Fast Forward and Fast Rewind
  //println( "Song Position", song1.position(), "Song Length", song1.length() );
  //
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song1.play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  //.play() includes .rewind()
  //
  if ( key>='1' || key<='9' ) { //Loop Button, previous (key=='1' || key=='9')
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    String keystr = String.valueOf(key);
    //println(keystr);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song1.loop(loopNum); //Parameter is number of repeats
    //
  }
  if ( key=='L' || key=='l' ) song1.loop(); //Infinite Loop, no parameter OR -1
  //
  if ( key=='M' || key=='m' ) { //MUTE Button
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( song1.isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      song1.unmute();
    } else {
      //Possible ERROR: Might rewind the song
      song1.mute();
    }
  } //End MUTE
  //
  //Possible ERROR: FF rewinds to parameter milliseconds from SONG Start
  //Possible ERROR: FR rewinds to parameter milliseconds from SONG Start
  //How does this get to be a true ff and fr button
  //Actual .skip() allows for varaible ff & fr using .position()+-
  if ( key=='F' || key=='f' ) song1.skip( 0 ); //SKIP forward 1 second (1000 milliseconds)
  if ( key=='R' || key=='r' ) song1.skip( 1000 ); //SKIP  backawrds 1 second, notice negative, (-1000 milliseconds)
  //
  //Simple STOP Behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
  if ( key=='S' | key=='s' ) {
    if ( song1.isPlaying() ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.rewind(); //Not Necessary
    }
  }
  //
  //Simple Pause Behaviour: .pause() & hold .position(), then PLAY
  if ( key=='Y' | key=='y' ) {
    if ( song1.isPlaying()==true ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.play(); //ERROR, doesn't play
    }
  }
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
