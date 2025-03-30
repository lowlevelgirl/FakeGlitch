#include <raylib.h>
#include <time.h>


void takeScreen() { /* make a screenshot */
	return;
}

void imageGlitch(Texture2D Texture[]) {	/* twitching images */
	DrawTexture(Texture[0], (rand() % 23) + 2, 0, WHITE);
	DrawTexture(Texture[1], (rand() % 10) + 2, 70, WHITE);
	DrawTexture(Texture[2], (rand() % 21) + 2, 170, WHITE);
	DrawTexture(Texture[3], (rand() % 19) + 2, 480, WHITE);
}

void errorRectangles() { /* add a green and pink rectangles */
	int i;
	for (i = 0; i < 4; i++) {
		DrawRectangle(0, rand() % GetScreenHeight(), GetScreenWidth(), rand() % 12, (Color) { 63, 255, 45, 255 });
		DrawRectangle(0, rand() % GetScreenHeight(), GetScreenWidth(), rand() % 12, (Color) { 255, 91, 248, 255 });
	}
	DrawRectangle(0, rand() % GetScreenHeight(), GetScreenWidth(), rand() % 90, (Color) { 255, 91, 248, 255 });
}

int main(int argc, char **argv) {
	SetConfigFlags(FLAG_WINDOW_TOPMOST | FLAG_WINDOW_UNDECORATED); /* fullscreen mode */
	InitWindow(GetScreenWidth(), GetScreenHeight(), "FakeGlitch");
	SetWindowPosition(0, 0);
	HideCursor();
	
	SetTargetFPS(60);
	
	if (argv[1] == false) { /* if .exe haven't any parameter the image will be screenshot */
		argv[1] = "screenshot.png";
	} 

	Image ScreenShot[] = { /* cut the image */
		LoadImage(argv[1]),
		LoadImage(argv[1]),
		LoadImage(argv[1]),
		LoadImage(argv[1])
	};

	int i;
	for (i = 0; i < 4; i++) { /* also cut the image */
		ImageResize(&ScreenShot[i], GetScreenWidth(), GetScreenHeight()); 
	}
	
	/* also cut the image */
	ImageCrop(&ScreenShot[0], (Rectangle) { 0, 0, GetScreenWidth(), 70 });
	ImageCrop(&ScreenShot[1], (Rectangle) { 0, 70, GetScreenWidth(), 170 });
	ImageCrop(&ScreenShot[2], (Rectangle) { 0, 170, GetScreenWidth(), 480 });
	ImageCrop(&ScreenShot[3], (Rectangle) { 0, 480, GetScreenWidth(), GetScreenHeight() });
	
	/* make textures */
	Texture2D Texture[] = {
		LoadTextureFromImage(ScreenShot[0]),
		LoadTextureFromImage(ScreenShot[1]),
		LoadTextureFromImage(ScreenShot[2]),
		LoadTextureFromImage(ScreenShot[3])
	};
	
	for (;;) {
		if (IsKeyDown(KEY_C)) { /* close the program if input C */
			break;
		}
		
		BeginDrawing();
		
		ClearBackground(BLACK);
		
		/* functions */
		imageGlitch(Texture);
		errorRectangles();
		
		EndDrawing();
	}
	
	CloseWindow();
}
   