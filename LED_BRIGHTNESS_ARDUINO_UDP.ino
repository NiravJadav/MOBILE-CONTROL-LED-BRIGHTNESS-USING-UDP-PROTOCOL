/*
  Student Name : Nirav Jadav (E.C. SEM-5 , Marwadi Education Foundation Group of Instituion , Rajkot.   )
  Guided by : Prof. Ravi Butani (E.C. Departmet , Marwadi Education Foundation Group of Instituion , Rajkot. )
*/

#include<ESP8266WiFi.h> // esp8266wifi library added
#include<WiFiUDP.h> // wifiudp library addded


WiFiUDP myudp;
IPAddress lip;
IPAddress bip;

char ssid[]="abhi";
char pass[]="abhijitn";
char packetBuffer[255];
int localport= 1290;
int LED[5]; 
int led=5; 
int led1=4; 
int led2=0; 
int led3=2; 



void setup() {
  // put your setup code here, to run once:
pinMode(led , OUTPUT);

pinMode(led1 , OUTPUT);
pinMode(led2 , OUTPUT);
pinMode(led3 , OUTPUT);
//pinMode(led4 , OUTPUT);
Serial.begin(9600);
Serial.println();

Serial.print("Connecting to...");
Serial.print(ssid);

WiFi.begin(ssid ,pass);

while(WiFi.status() != WL_CONNECTED){
  delay(500);
  Serial.print(".");
}

Serial.println();
Serial.println("You are Sucessfully Connected !");
Serial.print("Local IP :");
Serial.println(WiFi.localIP());
lip=WiFi.localIP();
bip=lip;
bip[3]=255;

myudp.begin(localport);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  int packetSize = myudp.parsePacket();
  if (packetSize) {
    Serial.print("Received packet of size ");
    Serial.println(packetSize);
    Serial.print("From ");
    IPAddress remoteIp = myudp.remoteIP();
    Serial.print(remoteIp);
    Serial.print(", port ");
    int remoteport = myudp.remotePort();
    Serial.println(remoteport);

    // read the packet into packetBufffer
    int len = myudp.read(packetBuffer, 255);
    if (len > 0) {
      packetBuffer[len] = 0;
    }
Serial.println("Contents:");
    Serial.println(packetBuffer);
}

chararray_2_intarray( packetBuffer , LED  );

analogWrite(led , LED[0]*2.55);
analogWrite(led1 , LED[1]*2.55);
analogWrite(led2 , LED[2]*2.55);
analogWrite(led3 , LED[3]*2.55);

}


void chararray_2_intarray(char* _in, int* _out)
{
  char *tmp;
  int i = 0;
  tmp = strtok(_in, ",");
  while (tmp) {
    _out[i++] = atoi(tmp);
    tmp = strtok(NULL, ",");
  }
}
