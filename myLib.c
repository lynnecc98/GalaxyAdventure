#include "myLib.h"

unsigned short *videoBuffer = (unsigned short *)0x6000000;

void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
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

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {
	// return (colA <= (colB + widthB - 1) && (colA + widthA - 1) >= colB 
	// 	&& rowA <= (rowB + heightB - 1) && (heightA + rowA - 1) >= rowB);
// }

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

