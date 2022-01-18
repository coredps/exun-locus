#include "raylib.h"
#include "iostream"
#include "vector"
#include "algorithm"
#include "string"

using std::vector, std::cout;


const int W = 400, H = 800;
const float G = 900;
const Color pink = {255, 33, 130, 255}, cyan = {39, 209, 245, 255}, yellow = {250, 212, 6, 255}, purple = {147, 46, 255, 255};

vector<Color> COLORS = {pink, cyan, yellow, purple};

struct Player {
	Vector2 pos = {W/2, H*0.8f};
	float speed = -320;
	Color color = COLORS[GetRandomValue(0, 3)];
	std::string score = "0";
	
};

struct Circle {
	Vector2 pos;
	float omega = 0, iradius = 90, oradius = 110;
	vector<Color> colors;
	

	Circle() {
		colors = COLORS;
		std::random_shuffle(colors.begin(), colors.end());			
	}
};

struct Star{
	Vector2 pos;
	bool taken = false;

	void addstar(Player &player) {
		taken = true;
		player.score = std::to_string(std::stoi(player.score) + 1);
	}
};

bool samecolor(Color &a, Color &b) {
	return a.r == b.r and a.b == b.b and a.g == b.g and a.a == b.a;
}

struct Colorswitch{
	Vector2 pos;
	bool taken = false;

	void changecolor(Color &col) {
		auto newcol = COLORS[GetRandomValue(0, 3)];
		while (samecolor(newcol, col)) {
			newcol = COLORS[GetRandomValue(0, 3)];
		}		
		col = newcol;
		taken = true;
	}
};

float mod(float x){
	if (x >= 360) return mod(x - 360);
	else return x;
}

struct gamestate {
	Player player;
	Camera2D camera;
	vector<Circle> circles;
	vector<Colorswitch> cswitches;
	vector<Star> stars; 

	gamestate() {
		camera.target = player.pos;
		camera.offset = Vector2{ W/2.0f, H/1.5};
		camera.rotation = 0.0f;
		camera.zoom = 1.0f;		

		for (int i = 0, k = 0;i<42;i++,k+=500) {
			Circle curr = Circle();
			curr.pos = Vector2{W/2, H/3 - float(k)};		
			circles.emplace_back(curr);
		}

		for(int i = 0, k = 0;i<41;i++, k+=500) {
			Colorswitch cswitch = Colorswitch();
			cswitch.pos = Vector2{W/2, H/3 - 250 - float(k)};
			cswitches.emplace_back(cswitch);
		}

		for(int i = 0, k = 0;i < 42;i++, k+=500){
			Star curr = Star();
			curr.pos = Vector2{W/2, H/3 - float(k)};
			stars.emplace_back(curr);
		}

	}


};

int main() {
	InitWindow(W, H, "");

	bool lost = true, canjump = false;

	gamestate state = gamestate();
	auto player = state.player;
	auto camera = state.camera;
	auto circles = state.circles;
	auto cswitches = state.cswitches;
	auto stars = state.stars;


	Image cswitch_img = LoadImage("imgs/colour_switch.png"), cstar_img = LoadImage("imgs/colour_star.png"), restart_img = LoadImage("imgs/restart.png");
	
	Texture2D texture_switch = LoadTextureFromImage(cswitch_img), texture_star = LoadTextureFromImage(cstar_img), texture_restart = LoadTextureFromImage(restart_img);
	UnloadImage(cswitch_img);         
	UnloadImage(cstar_img);
	UnloadImage(restart_img);

	float stomega = 0;	

	SetTargetFPS(120);
	while (!WindowShouldClose()) {

		float deltaTime = GetFrameTime();

		if (!lost) {
			if (IsKeyPressed(KEY_SPACE)) {			
				player.speed = -450;
				canjump = true;
			}
			if (canjump) {
				player.pos.y += player.speed * deltaTime;
				player.speed += G*deltaTime;
				camera.target = player.pos;
			}

			for (auto &circle : circles) {
				float y = circle.pos.y, ir = circle.iradius, our = circle.oradius;
				int index = 0;
				for(int i = 0;i<4;i++) if (samecolor(player.color, circle.colors[i])) index = i;				
				float theta = index * 90;
				
				if (player.pos.y >= y + ir and player.pos.y <= y + our and mod(circle.omega + theta) < 270) {
					lost = true;
					break;
				}
				if (player.pos.y >= y - our and player.pos.y <= y - ir and (mod(circle.omega + theta) < 90 or mod(circle.omega + theta) > 180)) {
					lost = true;
					break;
				}
			}

			for (auto &cswitch : cswitches) {
				
				if (player.pos.y <= cswitch.pos.y + 5 and !cswitch.taken) {
					cswitch.changecolor(player.color);
					break;
				}
			}

			for (auto &star : stars) {
				
				if (player.pos.y <= star.pos.y + 5 and !star.taken) {
					star.addstar(player);
					break;
				}
			}


			if (player.pos.y >= 800){
				player.speed = 0;
				canjump = false;
				lost = true;
			}
			for (auto &circle : circles){
				circle.omega += 100 * deltaTime;
				if (circle.omega >= 360) circle.omega -= 360;
			}
		}
		else{
			camera.target = {W/2, H*0.8f};
			stomega += 120 * deltaTime;

			if (IsMouseButtonPressed(0)){
				auto pos = GetMousePosition();
				
				if (pos.x >= W/2 - 60 and pos.x <= W/2 + 60 and pos.y >= 520 and pos.y <= 640) {
					lost = false;
					player = state.player;
					camera = state.camera;
					circles = state.circles;
					cswitches = state.cswitches;
					stars = state.stars;					
				}

				

			}			
		}
		

		BeginDrawing();
			ClearBackground(Color{24, 24, 24, 255});
			
			BeginMode2D(camera);
				if (!lost) {
					DrawCircleV(player.pos, 7, player.color);
					
					for(auto &circle : circles) {
						for (float angle = 0;angle <= 270;angle += 90){
							DrawRing(circle.pos, circle.iradius, circle.oradius, circle.omega + angle, circle.omega + 90 + angle, 0, circle.colors[(int)angle/90]);							
						}
					}

					for(auto &cswitch : cswitches) {
						if (!cswitch.taken) {
							DrawTexture(texture_switch, cswitch.pos.x - texture_switch.width/2 , cswitch.pos.y - texture_switch.height/2, WHITE);
						}
					}

					for(auto &star : stars) {
						if (!star.taken) {
							DrawTexture(texture_star, star.pos.x - texture_star.width/2 , star.pos.y - texture_star.height/2, WHITE);
						}
					}

					DrawText(player.score.c_str(), player.pos.x - 175, player.pos.y - 515, 50, WHITE);					
					
				}
				else{
					DrawText("C", 130, H/6, 42, WHITE);
					for(int i = 0;i<=270;i+=90){
						DrawRing(Vector2{173, H/6 + 20}, 10, 14, 0+i+stomega, 90+i+stomega, 0, COLORS[i/90]);
					}

					DrawText("L", 190, H/6, 42, WHITE);			

					for(int i = 0;i<=270;i+=90){
						DrawRing(Vector2{228, H/6 + 20}, 10, 14, 0+i-stomega, 90+i-stomega, 0, COLORS[i/90]);
					}
					
					DrawText("R", 246, H/6, 42, WHITE);
					
					DrawText("SWITCH", W/2 - 85, H/6+50, 42, WHITE);

					DrawRectangle(0, H/3, W, 50, Color{36, 36, 36, 255});

					DrawText("SCORE", W/2 - 50, H/3 + 10, 30, WHITE);

					DrawText(player.score.c_str(), W/2 - 10, 5*H/12, 50, WHITE);

					DrawRectangle(0, H/2, W, 50, Color{237, 143, 50, 255});

					DrawText("BEST SCORE", W/2 - 100, H/2 + 10, 30, WHITE);

					DrawText("69420", W/2 - 60, H/2+70, 50, WHITE);

					DrawTexture(texture_restart, W/2 - texture_restart.width/2 , 6*H/7 - texture_restart.height/2, WHITE);
				}
			EndMode2D();
		EndDrawing();
	}
}