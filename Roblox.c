/*
OLD ROBLOX 3D - LOW RAM VERSION (inspired by Blocks-TI-84)
Single file, optimized for tiny size & low RAM usage on TI-84 CE
- Filled 3D colored shapes (perspective projection)
- Baseplate + grid
- Blocky player with jump
- Old Roblox cursor
- ~10 FPS target like Blocks-TI-84
Compatible with arTIfiCE/Cesium

HOW TO BUILD (one command):
1. Save as old_roblox_lowram.c
2. Install CEdev: https://github.com/CE-Programming/toolchain
3. Run: make
4. Send the resulting .8xv to calculator + run with Cesium/arTIfiCE
*/

#include <graphx.h>
#include <keypadc.h>
#include <sys/timers.h>

#define W 320
#define H 240
#define CX 160
#define CY 120

float camY=42, camZ=-85, fov=175;
float px=0, py=0, pz=28, vy=0;
const float g=0.38f, jv=6.8f, ms=1.8f;

typedef struct{float x,y,z;}v3;

int proj(v3 p,int*sx,int*sy){
  float dz=p.z-camZ; if(dz<7)return 0;
  *sx=CX+(int)((p.x)*fov/dz);
  *sy=CY-(int)((p.y-camY)*fov/dz);
  return *sx>=0&&*sx<W&&*sy>=0&&*sy<H;
}

void box(float cx,float cy,float cz,float sx,float sy,float sz,uint8_t col){
  v3 c[8]={{cx-sx/2,cy-sy/2,cz-sz/2},{cx+sx/2,cy-sy/2,cz-sz/2},
           {cx+sx/2,cy+sy/2,cz-sz/2},{cx-sx/2,cy+sy/2,cz-sz/2},
           {cx-sx/2,cy-sy/2,cz+sz/2},{cx+sx/2,cy-sy/2,cz+sz/2},
           {cx+sx/2,cy+sy/2,cz+sz/2},{cx-sx/2,cy+sy/2,cz+sz/2}};
  int p[8][2];int v[8]={0};
  for(int i=0;i<8;i++)v[i]=proj(c[i],&p[i][0],&p[i][1]);
  gfx_SetColor(col);
  if(v[4]&&v[5]&&v[6]&&v[7]){gfx_FillTriangle(p[4][0],p[4][1],p[5][0],p[5][1],p[6][0],p[6][1]);gfx_FillTriangle(p[4][0],p[4][1],p[6][0],p[6][1],p[7][0],p[7][1]);}
  if(v[2]&&v[3]&&v[6]&&v[7]){gfx_FillTriangle(p[2][0],p[2][1],p[3][0],p[3][1],p[6][0],p[6][1]);gfx_FillTriangle(p[3][0],p[3][1],p[7][0],p[7][1],p[6][0],p[6][1]);}
}

void cur(int x,int y){
  gfx_SetColor(0);gfx_Line(x,y,x,y+13);gfx_Line(x,y,x+9,y+9);gfx_Line(x+1,y+1,x+1,y+11);
  gfx_SetColor(255);gfx_Line(x-1,y-1,x-1,y+14);gfx_Line(x-1,y-1,x+10,y+10);
}

int main(){
  gfx_Begin();gfx_SetDrawBuffer();
  while(1){
    kb_Scan();
    if(kb_Data[7]&kb_Up)pz-=ms;
    if(kb_Data[7]&kb_Down)pz+=ms;
    if(kb_Data[7]&kb_Left)px-=ms;
    if(kb_Data[7]&kb_Right)px+=ms;
    if((kb_Data[6]&kb_Enter)||(kb_Data[1]&kb_2nd))if(py<0.6f)vy=jv;
    vy-=g;py+=vy;if(py<0){py=0;vy=0;}
    if(px<-38)px=-38;if(px>38)px=38;
    if(pz<-38)pz=-38;if(pz>38)pz=38;

    gfx_FillScreen(26);

    gfx_SetColor(74);
    int x1,y1,x2,y2,x3,y3,x4,y4;
    if(proj((v3){-52,0,-52},&x1,&y1)&&proj((v3){52,0,-52},&x2,&y2)&&
       proj((v3){52,0,52},&x3,&y3)&&proj((v3){-52,0,52},&x4,&y4)){
      gfx_FillTriangle(x1,y1,x2,y2,x3,y3);
      gfx_FillTriangle(x1,y1,x3,y3,x4,y4);
    }

    gfx_SetColor(255);
    for(int i=-4;i<=4;i++){
      int a,b,c,d;
      if(proj((v3){-50,0,i*12.5f},&a,&b)&&proj((v3){50,0,i*12.5f},&c,&d))gfx_Line(a,b,c,d);
      if(proj((v3){i*12.5f,0,-50},&a,&b)&&proj((v3){i*12.5f,0,50},&c,&d))gfx_Line(a,b,c,d);
    }

    float x=px,y=py,z=pz;
    box(x,y+3.2f,z,3.8f,4.8f,2.8f,30);
    box(x,y+6.8f,z,3.2f,3.2f,3.2f,227);
    box(x-1.4f,y+0.4f,z-0.7f,1.6f,2.8f,1.6f,32);
    box(x+1.4f,y+0.4f,z+0.7f,1.6f,2.8f,1.6f,32);
    box(x-3.2f,y+3.6f,z,1.3f,3.6f,1.3f,30);
    box(x+3.2f,y+3.6f,z,1.3f,3.6f,1.3f,30);

    cur(158,85);
    gfx_SetTextFGColor(255);
    gfx_PrintStringXY("OLD ROBLOX",108,4);
    gfx_PrintStringXY("Arrows Move | ENTER Jump | CLEAR Exit",22,218);

    gfx_SwapDraw();
    delay(18);

    if(kb_Data[6]&kb_Clear)break;
  }
  gfx_End();
  return 0;
}
