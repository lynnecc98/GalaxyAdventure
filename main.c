#include "myLib.h"
#include "stdlib.h"

// Prototypes
void initialize();
void update();
void draw();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Variables
unsigned short bgColor;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rDel;
	int cDel;
	int height;
	int width;
} CHAR;

CHAR player, enemy1, enemy2, enemy3;

void initializeObjects (CHAR *thing, int row, int col, int oldRow, int oldCol, int rDel, int cDel, int height, int width);
void start();
void game();
void pause();
void lose();
void enemyReset();

int state;
int t = 270;
int lives; 
enum {START, GAME, PAUSE, LOSE};

int main() {

	initialize();

	while(1) {

		// Update the button variables each frame
		oldButtons = buttons;
		buttons = BUTTONS;

		switch (state) {
		case 0:
			start();
			break;
		case 1:
			game();
			break;
		case 2:
			pause();
			break;
		case 3:
			lose();
			break;
		}

		
	}
}

void start() {
	if (BUTTON_PRESSED(BUTTON_START)){
				state = GAME;
				lives = 3;
				// Initialize background
				bgColor = BLACK;
				fillScreen(bgColor);
				srand(t);
				// Initialize projectiles
				initializeObjects(&enemy1, rand() % 160,220 - rand() % 100,enemy1.row, enemy1.col, 0,-1,15,10);

				initializeObjects(&enemy2, rand() % 160,220 - rand() % 100,enemy2.row, enemy2.col, 0,-1,15,10);

				initializeObjects(&enemy3, rand() % 160,220 - rand() % 100,enemy3.row, enemy3.col, 0,-1,15,10);

				// Initialize player
				initializeObjects(&player, 60,20,player.row, player.col, 1,1,17,10);
			}
}

void initializeObjects (CHAR *thing, int row, int col, int oldRow, int oldCol, int rDel, int cDel, int height, int width){
	(*thing).row = row;
	(*thing).col = col;
	(*thing).oldRow = oldRow;
	(*thing).oldCol = oldCol;
	(*thing).rDel = rDel;
	(*thing).cDel = cDel;
	(*thing).height = height;
	(*thing).width = width;
}

void game() {
	t++;
	update();
	waitForVBlank();
	draw();

	if (BUTTON_PRESSED(BUTTON_START)) {
		state = PAUSE;
	}
}

void pause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		state = GAME;
		// Initialize background
		
		bgColor = BLACK;
		fillScreen(bgColor);
	}
	if (BUTTON_PRESSED(BUTTON_SELECT)) {
		state = START;
		fillScreen(WHITE);
	}
}

void lose(){
	bgColor = RED;
	fillScreen(bgColor);
	if (BUTTON_PRESSED(BUTTON_START)) {
		state = START;
		bgColor = BLACK;
		fillScreen(bgColor);
	}
}

// Sets up the display and the game objects
void initialize() {

	REG_DISPCTL = MODE3 | BG2_ENABLE;
	state = 0;

	buttons = BUTTONS;
	oldButtons = 0;

}

// Performs all of the game's calculations
void update() {

	if (BUTTON_HELD(BUTTON_UP)){
		if (player.row > 0) {
			player.row--;
		}	
	}
	if (BUTTON_HELD(BUTTON_DOWN)){
		if (player.row + 2 * player.height < 160) {
			player.row++;
		}
	}
	if (BUTTON_HELD(BUTTON_LEFT)){
		if (player.col > 0) {
			player.col--;
		}
	}
	if (BUTTON_HELD(BUTTON_RIGHT)){
		if (player.col + 2 * player.height< 240) {
			player.col++;
		}
	}

	// Enemy bounce walls
	if (enemy1.col - enemy1.width/2 <= 0 || enemy1.col + enemy1.width/2 - 1 >= SCREENWIDTH - 1){
		drawCircle(enemy1.oldRow, enemy1.oldCol, enemy1.width/2, bgColor);
		enemy1.row  = rand() % 160;
		enemy1.col = 220;
	}

	if (enemy2.col - enemy2.width/2 <= 0 || enemy2.col + enemy2.width/2 - 1 >= SCREENWIDTH - 1){
		drawCircle(enemy2.oldRow, enemy2.oldCol, enemy2.width/2, bgColor);
		enemy2.row  = rand() % 160;
		enemy2.col = 220;
	}

	if (enemy3.col - enemy3.width/2 <= 0 || enemy3.col + enemy3.width/2 - 1 >= SCREENWIDTH - 1){
		drawCircle(enemy3.oldRow, enemy3.oldCol, enemy3.width/2, bgColor);
		enemy3.row  = rand() % 160;
		enemy3.col = 220;
	}

	if (collision(player.row, player.col, player.height, 
		enemy1.row, enemy1.col, enemy1.height)){
		drawCircle(enemy1.oldRow, enemy1.oldCol, enemy1.width/2, bgColor);
		enemy1.row  = rand() % 160;
		enemy1.col = 220;
		drawCircle(20, 20 + (lives  - 1) * 20, enemy1.width/2, bgColor);
		lives--;
		if(lives == 0){
			state = LOSE;
		}
	}
	if (collision(player.row, player.col, player.height,
		enemy2.row, enemy2.col, enemy2.height)){
		drawCircle(enemy2.oldRow, enemy2.oldCol, enemy2.width/2, bgColor);
		enemy2.row  = rand() % 160;
		enemy2.col = 220;
		drawCircle(20, 20 + (lives  - 1) * 20, enemy1.width/2, bgColor);
		lives--;
		if(lives == 0){
			state = LOSE;
		}
	}
	if (collision(player.row, player.col, player.height,
		enemy3.row, enemy3.col, enemy3.height)){
		drawCircle(enemy3.oldRow, enemy3.oldCol, enemy3.width/2, bgColor);
		enemy3.row  = rand() % 160;
		enemy3.col = 220;
		drawCircle(20, 20 + (lives  - 1) * 20, enemy1.width/2, bgColor);
		lives--;
		if(lives == 0){
			state = LOSE;
		}
	}

	// Update projectile's position
	enemy1.row += enemy1.rDel;
	enemy1.col += enemy1.cDel;

	enemy2.row += enemy2.rDel;
	enemy2.col += enemy2.cDel;

	enemy3.row += enemy3.rDel;
	enemy3.col += enemy3.cDel;
}

// Performs all of the writing to the screen
void draw() {

	// Erase the previous locations
	drawCircle(enemy1.oldRow, enemy1.oldCol, enemy1.width/2, bgColor);
	drawCircle(enemy2.oldRow, enemy2.oldCol, enemy2.width/2, bgColor);
	drawCircle(enemy3.oldRow, enemy3.oldCol, enemy3.width/2, bgColor);
	drawTriangle(player.oldRow, player.oldCol, player.height, bgColor);

	// Draw the new locations
	drawCircle(enemy1.row, enemy1.col, enemy1.width/2, WHITE);
	drawCircle(enemy2.row, enemy2.col, enemy2.width/2, WHITE);
	drawCircle(enemy3.row, enemy3.col, enemy3.width/2, WHITE);
	drawTriangle(player.row, player.col, player.height, BLUE);

	for (int i = 0; i < lives; i++){
		drawCircle(20, 20 + i * 20, enemy1.width/2, RED);
	}

	// Update old variables
	enemy1.oldRow = enemy1.row;
	enemy1.oldCol = enemy1.col;
	enemy2.oldRow = enemy2.row;
	enemy2.oldCol = enemy2.col;
	enemy3.oldRow = enemy3.row;
	enemy3.oldCol = enemy3.col;
	player.oldRow = player.row;
	player.oldCol = player.col;
}