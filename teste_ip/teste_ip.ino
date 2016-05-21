#include <Ethernet.h>
#include <SPI.h>

byte mac[] = {  0x00, 0x26, 0x5A, 0x5A, 0x21, 0xD8 };
byte ip[] = { 192, 168, 1, 136 };
byte gateway[] = { 255, 255, 255, 0 };

EthernetClient client;

//String temp= "data=5";

void setup() {
  Serial.println("blablabla");
  Ethernet.begin(mac, ip, gateway);
  Serial.begin(9600);
  Serial.println(Ethernet.localIP());
  delay(1000);
  delay(1000);
  Serial.println("connecting...");

  String data = "user={\"first_name\": \"bla\", \"last_name\": \"blah\", \"email\": \"bla@gmail.com\", \"birthdate\": \"1999/10/10\", \"gender\": \"masculino\"}";
  Serial.println("trying");
  if (client.connect("ecobath.herokuapp.com", 80)) {
    Serial.println("Sending to Server: ");
    client.println("POST /users/new HTTP/1.1");
    Serial.print("POST /users/new HTTP/1.1");
    client.println("Host: ecobath.herokuapp.com");
    client.println("Content-Type: application/x-www-form-urlencoded");
    client.println("Connection: close");
    client.println("User-Agent: Arduino/1.0");
    client.print("Content-Length: ");
    client.println(data.length());
    client.println();
    client.print(data);
    client.println();
    Serial.println("Conected");

  } else {
    Serial.println("Cannot connect to Server");
  }
}

void loop() {
  if (client.available()) {
    char c = client.read();
    Serial.print(c);
  }

  if (!client.connected()) {
    Serial.println();
    Serial.println("disconnecting.");
    client.stop();
    for (;;)
      ;
  }

}

