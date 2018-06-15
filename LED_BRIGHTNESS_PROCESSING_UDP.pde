import hypermedia.net.*; // UDP LIBRARY 
UDP udp; // udp instance created

String ip = "192.168.43.255";  // the remote IP address
int port  = 1290;    // the destination port

int a1,a2,a3,a4;
int b1,b2,b3,b4;
int d1,d2,d3,d4;

void setup()
{
size(displayWidth , displayHeight);
udp = new UDP( this, 1290); //UDP started at port 1290  
udp.listen( true );
}

void draw(){
 background(98,66,244);
 rectMode(CORNER);
 fill(238, 244, 66);
 rect(0,0 ,width ,height/8);
 rect(0,7*height/8,width ,height/8);
 
 fill(244, 101, 65);
 rect(width/4 , height/6 , width/2,height/16 ); //backhand_ractangle
 rect(width/4 , 2*height/6 , width/2,height/16 );
 rect(width/4 , 3*height/6 , width/2,height/16 );
 rect(width/4 , 4*height/6 , width/2,height/16 );
 
fill(142,226,18);
rect(width/4 ,   height/6 , b1,height/16 ); //slider_ractangle
rect(width/4 , 2*height/6 , b2,height/16 );
rect(width/4 , 3*height/6 , b3,height/16 );
rect(width/4 , 4*height/6 , b4,height/16 );
 
 fill(5,184, 4);
 textSize(30);
 textAlign(CENTER);
 text("LED BRAITNESS CONTROL using UDP ", width/2, height/16);
 fill(226, 18, 52);
 text("Designed by - Nirav Jadav" , width/2 , 40*height/48);
 text("Guided by - Ravi Butani" , width/2 , 45*height/48);
 textSize(20);
 fill(0,0,0);
 text(d1+"%" ,  width/2,10*height/48);
 text(d2+"%" ,  width/2,18*height/48);
 text(d3+"%" ,  width/2,26*height/48);
 text(d4+"%" ,  width/2,34*height/48);
 
}

void mousePressed(){
  if(mouseX>width/4 && mouseX<width/4+width/2){
  if(mouseY>height/6 && mouseY<height/6+height/16){
   a1=mouseX;
   b1=mouseX-width/4;
   d1=100*b1/(width/2);
   
      }}
      
  if(mouseX>width/4 && mouseX<width/4+width/2){
  if(mouseY>2*height/6 && mouseY<2*height/6+height/16){
   a2=mouseX;
   b2=mouseX-width/4;
   d2=100*b2/(width/2);
 
    }}
  
  if(mouseX>width/4 && mouseX<width/4+width/2){
  if(mouseY>3*height/6 && mouseY<3*height/6+height/16){
   a3=mouseX;
   b3=mouseX-width/4;
   d3=100*b3/(width/2);
   
    }}
 
  if(mouseX>width/4 && mouseX<width/4+width/2){
  if(mouseY>4*height/6 && mouseY<4*height/6+height/16){
   a4=mouseX;
   b4=mouseX-width/4;
   d4=100*b4/(width/2);
 
      }}
      
   if(mouseX>width/4 && mouseX<width/4+width/2){
   if(mouseY>height/6 && mouseY<4*height/6+height/16){
     
 udp.send(str(d1)+","+str(d2)+","+str(d3)+","+str(d4), ip, port);
   }}
      
      
      
}