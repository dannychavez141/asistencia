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
      leerhuella2();
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
void leerhuella2() {
  if (v == 0)
  { finger.begin(57600);
    if (finger.verifyPassword()) {
    ////  Serial.println("Found fingerprint sensor!");
    } else {
      Serial.println("Did not find fingerprint sensor :(");
      while (1) {
        delay(1);
      }
    }

    finger.getTemplateCount();
    // Serial.print("Sensor contains ");
  //Serial.print(finger.templateCount); //Serial.println(" templates");
    //Serial.println("Waiting for valid finger...");
    v = 1;
    esperaalumno();
  }
  getFingerprintIDez2();
  delay(50);
}
void leerhuella() {
  if (v == 0)
  { finger.begin(57600);
    if (finger.verifyPassword()) {
     // Serial.println("Found fingerprint sensor!");
    } else {
    //  Serial.println("Did not find fingerprint sensor :(");
      while (1) {
        delay(1);
      }
    }

    finger.getTemplateCount();
    // Serial.print("Sensor contains ");
   // Serial.print(finger.templateCount); //Serial.println(" templates");
    //Serial.println("Waiting for valid finger...");
    v = 1;
    esperaalumno();
  }
  getFingerprintIDez();
  delay(50);
}
// returns -1 if failed, otherwise returns ID #
int getFingerprintIDez() {

  uint8_t p = finger.getImage();

  if (p != FINGERPRINT_OK) //verificacion si obtiene imagen 1
  {
    return -1;
  }
  p = finger.image2Tz();   //verificacion si la imagen es una huella2
  //Serial.println(finger.image2Tz(2));
  if (p != FINGERPRINT_OK) {
    return -1;
  }
  p = finger.fingerFastSearch();//verificacion si la imagen esta en la base de datos3
  if (p != FINGERPRINT_OK) {
    sonerr();
    cont++;
    if (cont >= 2) {
      cont = 0;
      digitalWrite(res, HIGH);
    }
    return -1;
  }

  // found a match!

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
  return finger.fingerID;
}
// returns -1 if failed, otherwise returns ID #
int getFingerprintIDez2() {

  uint8_t p = finger.getImage();

  if (p != FINGERPRINT_OK) //verificacion si obtiene imagen 1
  {
    return -1;
  }
  p = finger.image2Tz();   //verificacion si la imagen es una huella2
  //Serial.println(finger.image2Tz(2));
  if (p != FINGERPRINT_OK) {
    return -1;
  }
  p = finger.fingerFastSearch();//verificacion si la imagen esta en la base de datos3
  if (p != FINGERPRINT_OK) {
    sonerr();
    return -1;
  }

  // found a match!

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
  return finger.fingerID;
}
void registrarhuella()
{ esperacodigo();
  //Serial.println("Ready to enroll a fingerprint!");
  //Serial.println("Please type in the ID # (from 1 to 127) you want to save this finger as...");
  id = readnumber();
  if (id == 0) {// ID #0 not allowed, try again!
    return;
  }
  esperaregistrar();
  finger.begin(57600);
  Serial.print("Enrolling ID #");
  Serial.println(id);

  while (!  getFingerprintEnroll() );
}

uint8_t getFingerprintEnroll() {

  int p = -1;
  //Serial.print("Waiting for valid finger to enroll as #");
  Serial.println(id);
  while (p != FINGERPRINT_OK) {
    p = finger.getImage();
    switch (p) {
      case FINGERPRINT_OK:
        //Serial.println("Image taken");
        // lcd.clear();
        //  lcd.setCursor(0, 0);
        // lcd.print("Image taken");
        break;
      case FINGERPRINT_NOFINGER:
        // Serial.println(".");
        //   lcd.clear();
        //  lcd.setCursor(0, 0);
        //lcd.print(".");
        break;
      case FINGERPRINT_PACKETRECIEVEERR:
        //  Serial.println("Communication error");
        //lcd.clear();
        //lcd.setCursor(0, 0);
        // lcd.print("Communication error");
        break;
      case FINGERPRINT_IMAGEFAIL:
        //   Serial.println("Imaging error");
        //  lcd.clear();
        // lcd.setCursor(0, 0);
        // lcd.print("Imaging error");
        break;
      default:
        //  Serial.println("Unknown error");
        break;
    }

  }

  // OK success!

  p = finger.image2Tz(1);
  switch (p) {
    case FINGERPRINT_OK:
      //  Serial.println("Image converted");
      break;
    case FINGERPRINT_IMAGEMESS:
      //   Serial.println("Image too messy");
      return p;
    case FINGERPRINT_PACKETRECIEVEERR:
      //  Serial.println("Communication error");
      return p;
    case FINGERPRINT_FEATUREFAIL:
      //  Serial.println("Could not find fingerprint features");
      return p;
    case FINGERPRINT_INVALIDIMAGE:
      // Serial.println("Could not find fingerprint features");
      return p;
    default:
      Serial.println("Unknown error");
      return p;
  }
  sonok();
  removerdedo();
  Serial.println("Remove finger");
  delay(2000);
  p = 0;
  while (p != FINGERPRINT_NOFINGER) {
    p = finger.getImage();
  }
  Serial.print("ID "); Serial.println(id);
  p = -1;
  sonok();
  ponerdedo();
  Serial.println("Place same finger again");
  while (p != FINGERPRINT_OK) {
    p = finger.getImage();
    switch (p) {
      case FINGERPRINT_OK:
        Serial.println("Image taken");
        break;
      case FINGERPRINT_NOFINGER:
        Serial.print(".");
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
  Serial.print("Creating model for #");  Serial.println(id);

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

  Serial.print("ID "); Serial.println(id);
  p = finger.storeModel(id);
  if (p == FINGERPRINT_OK) {
    Serial.println("Stored!");
    sonok();
    confregalumno();
    p = -1;
    delay(1000);
    digitalWrite(res, HIGH);
    return p;
  } else if (p == FINGERPRINT_PACKETRECIEVEERR) {
    Serial.println("Communication error");
    return p;
  } else if (p == FINGERPRINT_BADLOCATION) {
    Serial.println("Could not store in that location");
    return p;
  } else if (p == FINGERPRINT_FLASHERR) {
    Serial.println("Error writing to flash");
    return p;
  } else {
    Serial.println("Unknown error");
    return p;
  }
}
