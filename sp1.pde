String[] grupper = {"GROUP A", "GROUP B", "GROUP C", "GROUP D"};

String[][] hold = {
  {"RUSSIA", "SAUDI ARABIA", "EGYPT", "URUGUAY"},
  {"PORTUGAL", "SPAIN", "MOROCCO", "IRAN"},
  {"FRANCE", "AUSTRALIA", "PERU", "DENMARK"},
  {"ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"}
};

String[][] flagFiler = {
  {"russia.png", "saudi.png", "egypt.png", "uruguay.png"},
  {"portugal.png", "spain.png", "morocco.png", "iran.png"},
  {"france.png", "australia.png", "peru.png", "denmark.png"},
  {"argentina.png", "iceland.png", "croatia.png", "nigeria.png"}
};

PImage[][] flag = new PImage[4][4];

int headerHøjde = 32;  
int rækkeHøjde = 32;   

color kantFarve = color(0, 50, 100);
color headerFarve = color(0, 50, 100);

color[] gruppeTekstFarver = {
  color(0, 200, 255),
  color(0, 200, 255),
  color(255, 255, 0),
  color(255, 255, 0)
};

void setup() {
  size(720, 320);
  textSize(16);
  textAlign(LEFT, CENTER);
  strokeWeight(8);

  for (int g = 0; g < 4; g++) {
    for (int i = 0; i < 4; i++) {
      flag[g][i] = loadImage(flagFiler[g][i]);
    }
  }
}

void draw() {
  background(255);
  stroke(kantFarve);

  int panelBredde = width / 2;
  int panelHøjde = height / 2; 

  for (int g = 0; g < 4; g++) {
    int kol = g % 2;
    int ræk = g / 2;
    int x = kol * panelBredde;
    int y = ræk * panelHøjde;

    fill(255);
    rect(x, y, panelBredde, panelHøjde);

    fill(headerFarve);
    rect(x, y, panelBredde, headerHøjde);
    fill(gruppeTekstFarver[g]);
    textAlign(CENTER, CENTER);
    text(grupper[g], x + panelBredde/2, y + headerHøjde/2);

    textAlign(LEFT, CENTER);
    for (int i = 0; i < 4; i++) {
      fill(240);
      int ry = y + headerHøjde + i * rækkeHøjde;
      rect(x, ry, panelBredde, rækkeHøjde);

      image(flag[g][i], x + 10, ry + 6, 30, 20); 
      fill(0);
      text(hold[g][i], x + 50, ry + rækkeHøjde/2);
    }
  }

  stroke(255);
  strokeWeight(2);
  line(width/2, 0, width/2, height);
  strokeWeight(8);
}
