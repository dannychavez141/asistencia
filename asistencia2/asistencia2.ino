#include <SPI.h>      // incluye libreria bus SPI
#include <Adafruit_Fingerprint.h>
#include <SoftwareSerial.h> //puertos de comunicacion
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2); // set the LCD address to 0x27 for a 16 chars and 2 line display
SoftwareSerial huella(3, 4); //puerto seria de huellero
char modo = 'a';
Adafruit_Fingerprint finger = Adafruit_Fingerprint(&huella);
uint8_t id;
int t, v = 0;
const int pinBuzzer = 5;// pin de bocina
const int led = 6;
const int res = 8;
int cont = 0;
String codigo = "";
SoftwareSerial BT(0, 1);
void setup() {
  BT.begin(9600);
  Serial.begin(9600);     // inicializa comunicacion por monitor serie a 9600 bps
  while (!Serial);
  while (!BT);
  Serial.print("empezar?");
  delay(100);
  lcd.init();
  lcd.backlight();
  pinMode(led, OUTPUT);
  pinMode(res, OUTPUT );
  digitalWrite(res, LOW);
}
uint8_t readnumber(void) {
  uint8_t num = 0;
  while (num == 0) {
    if (BT.available() > 0)
    { num = BT.parseInt();
      Serial.print("codigo:");
      Serial.println(num);
    }
  }
  return num;
}
void loop() {
  leerbt();
  menu();
}
void menu() {
  // seleccion de modo
  switch (modo) {
    case 'a':
      bienvenida();
      break;
    case 'b':
      leerbt();
      registrarhuella();
      break;
    case 'c':
      leerbt();
      leerhuella();
      break;
    case 'd':
      leerbt();
      
      break;
    default:
      break;
  }
}
// leer blutoOTH
void leerbt()
{
  if (BT.available() > 0)
  { modo = (char)BT.read();
    Serial.print(modo);
    Serial.println("#");
  }
}
//mensaje bienvenida en lcd
void bienvenida() {
  t = 0;
  do {
    leerbt();
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print(" BIENVENIDOS AL ");
    lcd.setCursor(0, 1);
    lcd.print("  SISTEMA MOVIL");
    delay(100);
    t = t + 100;
  } while (t <= 1000);
  t = 0;
  do {
    leerbt();
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("  DE CONTROL DE ");
    lcd.setCursor(0, 1);
    lcd.print("ASISTENCIAS UNU");
    delay(100);
    t = t + 100;
  } while (t <= 1000);

}
//mesj de espera de alumno
void esperaalumno() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("PONER HUELLA");
  lcd.setCursor(0, 1);
  lcd.print("PARA IDENTIFICAR");
  delay(1000);
}
//
void boton() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("PRESIONE BOTON");
  lcd.setCursor(0, 1);
  lcd.print("PARA CONTINUAR");
  delay(500);
}
void esperaregistrar() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("ESPERANDO HUELLA");
  lcd.setCursor(0, 1);
  lcd.print("PARA REGISTRAR ");
  delay(500);
}
void esperacodigo() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("ESPERANDO CODIGO");
  Serial.println("ESPERANDO CODIGO PARA REGISTRAR");
  lcd.setCursor(0, 1);
  lcd.print("PARA REGISTRAR");
  Serial.println("esperando huella");
  delay(500);
}
void removerdedo() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("  QUITE EL ");
  lcd.setCursor(0, 1);
  lcd.print("  DEDO");
  Serial.println("QUITE EL DEDO");
}
void ponerdedo() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("  PONER EL ");
  lcd.setCursor(0, 1);
  lcd.print("  DEDO");

}
void error() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("  HUELLA NO ");
  lcd.setCursor(0, 1);
  lcd.print("  REGISTRADA");
  //  Serial.println("huella no registrada");
}
void confregalumno() {
  t = 0;
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("HUELLA");
  lcd.setCursor(0, 1);
  lcd.print("REGISTRADA");
  //Serial.println("huella registrada");
  delay(1000);
}
void confasistencia() {

  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("CORRECTAMENTE");
  lcd.setCursor(0, 1);
  lcd.print("IDENTIFICADO");
  //  Serial.println("correctamente identificado");
  delay(1000);

}
void sonidook() {
  //generar tono de 440Hz durante 1000 ms
  digitalWrite(led, HIGH);
  tone(pinBuzzer, 440);
  delay(500);
  //detener tono durante 500ms
  noTone(pinBuzzer);
  digitalWrite(led, LOW);
  codigo = codigo + "#";
  Serial.print(codigo);
  BT.print(codigo);
}
void sonok() {
  //generar tono de 440Hz durante 500 ms
  digitalWrite(led, HIGH);
  tone(pinBuzzer, 440);
  delay(500);

  //detener tono durante 440ms
  noTone(pinBuzzer);
  digitalWrite(led, LOW);

}
void sonerr() {
  error();
  //generar tono de 440Hz durante 250 ms
  digitalWrite(led, HIGH);
  tone(pinBuzzer, 440);
  delay(250);
  //detener tono durante 250ms
  digitalWrite(led, LOW);
  noTone(pinBuzzer);
  delay(250);
  digitalWrite(led, HIGH);
  tone(pinBuzzer, 440);

  delay(250);

  //detener tono durante 500ms
  noTone(pinBuzzer);
  digitalWrite(led, LOW);
  esperaalumno();
}

 
void leerhuella() {

  uint8_t p = finger.getImage();

while (p != FINGERPRINT_OK) {
   if(Serial2.available())    // Si llega un dato por el puerto BT se envía al monitor serial
  {
    Serial.write(Serial2.read());
  }
    p = finger.getImage();
    switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image taken");
      break;
    case FINGERPRINT_NOFINGER:
     // Serial.println(".");
      break;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      break;
    case FINGERPRINT_IMAGEFAIL:
      Serial.println("Imaging error");
      break;
    default:
      Serial.println("Unknown error");
      break;
    }
  }

  // OK success!

  p = finger.image2Tz(1);
  switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
    
 p = finger.getModel();
  switch (p) {
    case FINGERPRINT_OK:
      
      break;
   default:
      
      return p;
  }
  
  // one data packet is 267 bytes. in one data packet, 11 bytes are 'usesless' :D
  uint8_t bytesReceived[534]; // 2 data packets
  memset(bytesReceived, 0xff, 534);

  uint32_t starttime = millis();
  int i = 0;
  while (i < 534 && (millis() - starttime) < 20000) {
      if (huella.available()) {
          bytesReceived[i++] = huella.read();
      }
  }
  Serial.print(i); Serial.println(" bytes read.");
  Serial.println("Decodificando huella...");

  uint8_t fingerTemplate[512]; // the real template
  memset(fingerTemplate, 0xff, 512);

  // filtering only the data packets
  int uindx = 9, index = 0;
  while (index < 534) {
      while (index < uindx) ++index;
      uindx += 256;
      while (index < uindx) {
          fingerTemplate[index++] = bytesReceived[index];
      }
      uindx += 2;
      while (index < uindx) ++index;
      uindx = index + 9;
  }
  for (int i = 0; i < 512; ++i) {
      printHex(fingerTemplate[i], 2);
      Serial.print(",");
      Serial2.print(",");
  }
     Serial2.print("#");
  Serial.println("\ndone.");



  
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("ALUMNO:");
  lcd.print(finger.fingerID);
  lcd.setCursor(0, 1);
  lcd.print("IGUALDAD:");
  lcd.print(finger.confidence);
  codigo = finger.fingerID;
  sonidook();
  confasistencia();
  esperaalumno();
  
}

void registrarhuella()
{ esperacodigo();
uint8_t p = finger.getImage();

while (p != FINGERPRINT_OK) {
    p = finger.getImage();
    switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image taken");
      break;
    case FINGERPRINT_NOFINGER:
     // Serial.println(".");
      break;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      break;
    case FINGERPRINT_IMAGEFAIL:
      Serial.println("Imaging error");
      break;
    default:
      Serial.println("Unknown error");
      break;
    }
  }

  // OK success!

  p = finger.image2Tz(1);
  switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
  Serial.println("Remove finger");
  sonok();
  removerdedo();

  p = 0;
  while (p != FINGERPRINT_NOFINGER) {
    p = finger.getImage();
  }
  p = -1;
  Serial.println("Place same finger again");
  while (p != FINGERPRINT_OK) {
    p = finger.getImage();
    switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image taken");
      break;
    case FINGERPRINT_NOFINGER:
     // Serial.print(".");
      break;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      break;
    case FINGERPRINT_IMAGEFAIL:
      Serial.println("Imaging error");
      break;
    default:
      Serial.println("Unknown error");
      break;
    }
  }
  // OK success!
  p = finger.image2Tz(2);
  switch (p) {
    case FINGERPRINT_OK:
      Serial.println("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
  
  // OK converted!
  
  p = finger.createModel();
  if (p == FINGERPRINT_OK) {
    Serial.println("Prints matched!");
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_ENROLLMISMATCH) {
    Serial.println("Fingerprints did not match");
    return p;
  } else {
    Serial.println("Unknown error");
    return p;
  } 

  p = finger.createModel();
  if (p == FINGERPRINT_OK) {
    Serial.println("Prints matched!");
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_ENROLLMISMATCH) {
    Serial.println("Fingerprints did not match");
    return p;
  } else {
    Serial.println("Unknown error");
    return p;
  }
     
  Serial.println("------------------------------------");
   p = finger.getModel();
  switch (p) {
    case FINGERPRINT_OK:
      
      break;
   default:
      
      return p;
  }
  
  // one data packet is 267 bytes. in one data packet, 11 bytes are 'usesless' :D
  uint8_t bytesReceived[534]; // 2 data packets
  memset(bytesReceived, 0xff, 534);

  uint32_t starttime = millis();
  int i = 0;
  while (i < 534 && (millis() - starttime) < 20000) {
      if (huella.available()) {
          bytesReceived[i++] = huella.read();
      }
  }
  Serial.print(i); Serial.println(" bytes read.");
  Serial.println("Decodificando huella...");

  uint8_t fingerTemplate[512]; // the real template
  memset(fingerTemplate, 0xff, 512);

  // filtering only the data packets
  int uindx = 9, index = 0;
  while (index < 534) {
      while (index < uindx) ++index;
      uindx += 256;
      while (index < uindx) {
          fingerTemplate[index++] = bytesReceived[index];
      }
      uindx += 2;
      while (index < uindx) ++index;
      uindx = index + 9;
  }
  for (int i = 0; i < 512; ++i) {
      printHex(fingerTemplate[i], 2);
      Serial.print(",");
      Serial2.print(",");
  }
     Serial2.print("#");
  Serial.println("\ndone.");
  
}
void printHex(int num, int precision) {
    char tmp[16];
    char format[128];
 
    sprintf(format, "%%.%dX", precision);
 
    sprintf(tmp, format, num);
    
    Serial.print(tmp);
    Serial2.print(tmp);
    
}
