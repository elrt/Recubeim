final int BLOCK_SIZE = 30;
final int PLAYER_W = 29, PLAYER_H = 39;
final int WORLD_WIDTH = 4000;
final int WORLD_HEIGHT = 2000;
final float GRAVITY = 0.6;
final float JUMP_FORCE = -12;
final float MOVE_SPEED = 0.5;
final float FRICTION = 0.85;

int currentTrack = 0;
final int SPRITESHEET_COLS = 16; // Количество столбцов в спрайтшити
final int SPRITESHEET_ROWS = 20; 
final int TOTAL_BLOCKS = SPRITESHEET_COLS * SPRITESHEET_ROWS;
int selectedBlockIndex = 0;
PImage[] plr =new PImage[3]; 
int currentFrame = 0;
int frameDelay = 10; 

int frameCount = 0; 
boolean isMoving = false; 

boolean movingLeft = false; 

int TRUNK_ID = 7;         
int LEAVES_ID = 15;         
float TREE_CHANCE = 0.04;  
int TRUNK_HEIGHT = 3;      
int LEAVES_SIZE = 3;       
float playerX, playerY=500;
float velocityX, velocityY;
boolean isGrounded = false;
boolean moveLeft = false, moveRight = false;
boolean layer = false;
ArrayList<Block> blocks = new ArrayList<Block>();
boolean isBreakingBlock = false;
boolean isPlacingBlock = false;
boolean inventoryOpen = false;

int[] availableBlocks = new int[TOTAL_BLOCKS];
int[] hotbar = new int[9];


boolean isSaving = false;
boolean isLoading = false;
String fileName = "";
String inputLabel = "";
float camX, camY;
float visLeft, visRight, visTop, visBottom;
PImage spriteSheet;
PImage Logo;
PImage inv;
PImage[] blockSprites = new PImage[500];
int scenes=0;
ArrayList<Cloud> clouds = new ArrayList<Cloud>();
float nextSpawnTime = 3000; 

//scene=0; - menu; scene=1; - game;scene=2; - controls;
