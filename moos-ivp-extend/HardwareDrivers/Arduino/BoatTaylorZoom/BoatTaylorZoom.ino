#define INPUT_SIZE 30
//Motor pints
int leftMot = 3;
int rightMot = 9;
//Range for motor out
int fRange = 62;
int bRange = 60;// Was 85
//Neutral motor value
int neutralVal = 187;
//Long int use to count idle time
long i = 0;
//Use to store left and right char values
char * leftChar;
char * rightChar;
char storageChar[20];
//Use to store incoming values and max buff value.
char retChar, storeBuff[41];
int buffCount = 0;
//Stored float values
float leftV;
float rightV;

//Unique characters we look for in string
char leftDelimiter = '_';
char rightDelimiter = '&';

void setup() {
  //Enable pins, and set original motor values to idle.
  pinMode(leftMot, OUTPUT);
  pinMode(rightMot, OUTPUT);
  Serial.begin(115200);
  sendSignal(0.0,0.0);
}

void loop() {
  //If we have values being written read.
  if (Serial.available()) {
    //Read a single char at a time
    retChar = Serial.read();
    //If we see the & symbol it is the end of our string
    if(retChar == rightDelimiter){   
      //Add the string terminator
      storeBuff[buffCount++] = '\0';
      //reset buffer.      
      buffCount = 0;
      //If we see a _ character we know our string is correct
      if(((String)storeBuff).indexOf("_") > 0){
        //Get the left float
        leftChar = strtok(storeBuff, "_");
        //Get the right float
        rightChar = strtok(0, "");
        //Create a storageChar that will hold right value so it cannot be over written
        //Copy value into storage char
        strcpy(storageChar,rightChar);
        //Terminate left float value
        leftChar[sizeof((String)leftChar)] = '\0'; 
        //Convert
        leftV = atof(leftChar);
        //Terminate right float value
        storageChar[sizeof((String)storageChar)] = '\0'; 
        //Convert
        rightV = atof(storageChar);
        //Send signal
        sendSignal(leftV,rightV);
        //reset idle time
        i=0;
      
      }
    }
    //If we are recieving blank data just ignore
    else if(retChar == '\0'){
      i=0;
    }
    //If our buffer is overflowing we are recieving garbage and may need to shut down
    else if(buffCount > 40){
      //reset buffer
      buffCount = 0;
      //Incriment incase of shutdown
      i++; 
    }
    //We add to our incoming buffer to later convert
    else{  
      storeBuff[buffCount++] = retChar;
      i=0;
    }
  }
  //If we are not recieving a signal idle after about 2 seconds.
  else{
    i++;
    if (i>1152000){
      sendSignal(0.0,0.0);
      i=0;
    }
  }
}
//Write to motor controllers.
void sendSignal(float leftVal,float rightVal){
  //LeftSide
  if (leftVal == 0) {
    analogWrite(leftMot, neutralVal);
  } else if (leftVal > 0) {
    //forward left
    analogWrite(leftMot, int((fRange * (abs(leftVal / (double)100))) + 190));
  } else if (leftVal < 0) {
    analogWrite(leftMot, int((bRange * (1 - abs(leftVal / (double)100))) + 125)); //Was + 100
  }else{
    analogWrite(leftMot, neutralVal);
  }
  //rightSide
  if (rightVal == 0) {
    analogWrite(rightMot, neutralVal);
  } else if (rightVal > 0) {
    //forward left
    analogWrite(rightMot, int((fRange * (abs(rightVal / (double)100))) + 190));
  } else if (rightVal < 0) {
    analogWrite(rightMot, int((bRange * (1 - abs(rightVal / (double)100))) + 125));
  }else{
    analogWrite(rightMot, neutralVal);
  }
}
