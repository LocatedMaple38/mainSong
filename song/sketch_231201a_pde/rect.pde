void rect1(){
image(skip, xskip, yskip, widthskip, heightskip);
image(prev, xprev, yprev, widthprev, heightprev);
image(fasrFowerd, xFF, yFF, widthFF, heightFF);
image(fastRewind, xFR, yFR, widthFR, heightFR);
if(playTF == false){
  image(paws, xStop, yStop, widthStop, heightStop);
}else{
  image(play, xStart, yStart, widthStart, heightStart);
}
if(repeatTF == false){
  image(repeat, xLoop, yLoop, widthLoop, heightLoop);
}else if(reapet1TF == false){
  image(repeat, xLoop, yLoop, widthLoop, heightLoop);
}else{
  image(repeat1, xLoop, yLoop, widthLoop, heightLoop);
}
if(shuffelTF == false){
  image(shuffel, xshuffel ,yshuffel, widthshuffel, heightshuffel);
}else{
  image(shuffel, xshuffel ,yshuffel, widthshuffel, heightshuffel);
}
}
