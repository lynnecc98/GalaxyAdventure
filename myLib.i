# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 39 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawTriangle(int row, int col, int height, unsigned short color);
void drawCircle(int, int, int, unsigned short);
void fillScreen(unsigned short color);

void start();
void game();
void pause();
void lose();
void enemyReset();

void waitForVBlank();
# 72 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 84 "myLib.h"
int collision(int rowA, int colA, int heightA, int rowB, int colB, int heightB);
# 2 "myLib.c" 2

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {

    for (int i =0;i<height;i++){
  for (int j =0; j<width;j++){
   setPixel(row + i, col + j, color);
  }

 }
}

void drawCircle(int row, int col, int radius, unsigned short color) {
 for(int y=-radius; y<=radius; y++){
     for(int x=-radius; x<=radius; x++){
         if(x*x+y*y <= radius*radius){
             setPixel(row+x, col+y, color);
         }
     }
 }
}

void drawTriangle(int row, int col, int height, unsigned short color) {
 for (int i = 0; i < height; i ++) {
  for (int j = 0; j <= 2*i; j ++) {
   setPixel(row + i, col + j, color);
  }
 }
 for (int i = 0; i < height; i ++) {
  for (int j = 2*(height-i); j >= 0; j -= 2) {
   setPixel(row + height + i, col + j, color);
  }
 }
}

void fillScreen(unsigned short color) {
 for (int i = 0; i < 38400; i++){
  videoBuffer[i] = color;
 }
}

void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}






int collision(int rowA, int colA, int heightA, int rowB, int colB, int heightB) {
 for (int i = 0; i < heightA; i ++) {
  if(colA <= (colB + heightB - 1) && (colA + 2 * i - 1) >= colB
    && rowA <= (rowB + heightB - 1) && (rowA + i - 1) >= rowB){
   return 1;
  }
 }
 for (int i = 0; i < heightA; i ++) {
  if(colA <= (colB + heightB) && (colA + 2 * (heightA - i)) >= colB
   && rowA <= (rowB + heightB) && (rowA + heightA + i) >= rowB){
   return 1;
  }
 }
 return 0;
}
