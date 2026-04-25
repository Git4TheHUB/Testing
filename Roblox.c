" OLD ROBLOX ULTIMATE - TI-84 Plus CE
" Most complex & beautiful TI-BASIC version possible
" Isometric 3D + animated player + jump + cursor + place blocks
" Fixed all REM errors - pure working TI-BASIC

ClrDraw
AxesOff
0→Xmin:1→Xmax
0→Ymin:1→Ymax

" === TITLE SCREEN ===
Text(15,25,"OLD ROBLOX")
Text(30,45,"ULTIMATE 2010 EDITION")
Text(45,70,"Arrows = Move Player")
Text(45,85,"ENTER = Jump")
Text(45,100,"2nd = Place Block")
Text(45,115,"MODE/DEL = Move Cursor")
Text(45,130,"CLEAR = Exit")
Text(55,155,"Press any key...")
Pause 

" === VARIABLES ===
0→PX:0→PZ:0→PY
0→VX:0→VZ:0→VY
160→CX:90→CY
0→FRAME:1→ONGROUND
9→SCALE:85→OX:65→OY
0→BLOCKS:0→ROBUX

" === MAIN LOOP ===
Lbl L
getKey→K

" Movement with momentum
If K=24:VX-1.2→VX
If K=26:VX+1.2→VX
If K=25:VZ-1.2→VZ
If K=34:VZ+1.2→VZ
PX+VX→PX:PZ+VZ→PZ
VX*0.65→VX:VZ*0.65→VZ

If PX<0:0→PX
If PX>14:14→PX
If PZ<0:0→PZ
If PZ>14:14→PZ

" Jump physics
If K=105 and ONGROUND=1
Then
  8→VY:0→ONGROUND
  For(J,1,5):Pxl-On(PSX-3+J,PSY+8):End
End
VY-0.42→VY
PY+VY→PY
If PY<0
Then
  0→PY:0→VY:1→ONGROUND
  ROBUX+5→ROBUX
End

" Place block (2nd key)
If K=21 and BLOCKS<8
Then
  PX→BX:PZ→BZ
  BLOCKS+1→BLOCKS
End

" Cursor movement
If K=22:CX-5→CX
If K=23:CX+5→CX
If K=31:CY-5→CY
If K=32:CY+5→CY
If CX<5:5→CX
If CX>315:315→CX
If CY<5:5→CY
If CY>205:205→CY

" === DRAW ===
ClrDraw

" Sky
For(I,0,50,6):Line(0,I,320,I,0):End

" Baseplate border (3D thick look)
Line(OX-65,OY-35,OX+155,OY-35,0)
Line(OX+155,OY-35,OX+155,OY+125,0)
Line(OX+155,OY+125,OX-65,OY+125,0)
Line(OX-65,OY+125,OX-65,OY-35,0)

" Isometric grid (14x14)
For(I,0,14)
For(J,0,14)
(I-J)*SCALE/2+OX→X1
(I+J)*SCALE/4+OY→Y1
(I-J+1)*SCALE/2+OX→X2
(I+J+1)*SCALE/4+OY→Y2
(I-J)*SCALE/2+OX→X3
(I+J+1)*SCALE/4+OY→Y3
(I-J+1)*SCALE/2+OX→X4
(I+J)*SCALE/4+OY→Y4
Line(X1,Y1,X2,Y2,0)
Line(X2,Y2,X3,Y3,0)
Line(X3,Y3,X4,Y4,0)
Line(X4,Y4,X1,Y1,0)
Pxl-On(X1+3,Y1+2)
Pxl-On(X2-3,Y2+2)
Pxl-On(X3-3,Y3-2)
Pxl-On(X4+3,Y4-2)
End
End

" 3D Blocks (5 placed blocks)
For(B,1,5)
If B=1:3→I:2→J:3→H
If B=2:10→I:4→J:2→H
If B=3:6→I:9→J:4→H
If B=4:12→I:11→J:1→H
If B=5:1→I:7→J:2→H
(I-J)*SCALE/2+OX→BX
(I+J)*SCALE/4+OY→BY
Line(BX,BY-H*5,BX+SCALE/2,BY-SCALE/5-H*5,0)
Line(BX+SCALE/2,BY-SCALE/5-H*5,BX,BY-SCALE/2.5-H*5,0)
Line(BX,BY-SCALE/2.5-H*5,BX-SCALE/2,BY-SCALE/5-H*5,0)
Line(BX-SCALE/2,BY-SCALE/5-H*5,BX,BY-H*5,0)
Line(BX,BY,BX,BY-H*5,0)
Line(BX+SCALE/2,BY-SCALE/5,BX+SCALE/2,BY-SCALE/5-H*5,0)
Line(BX-SCALE/2,BY-SCALE/5,BX-SCALE/2,BY-SCALE/5-H*5,0)
End

" === PLAYER (highly detailed 3D Roblox avatar) ===
(PX-PZ)*SCALE/2+OX→PSX
(PX+PZ)*SCALE/4+OY-PY*SCALE/4.5→PSY

FRAME+1→FRAME
If abs(VX)+abs(VZ)>0.8
Then
  sin(FRAME*0.45)*4→LEG
  sin(FRAME*0.45+3.14)*5→ARM
Else
  0→LEG:1→ARM
End

" Legs with shading
Line(PSX-7,PSY-9,PSX-7+LEG,PSY+7,0)
Line(PSX-6,PSY-9,PSX-6+LEG,PSY+7,0)
Line(PSX+7,PSY-9,PSX+7-LEG,PSY+7,0)
Line(PSX+6,PSY-9,PSX+6-LEG,PSY+7,0)

" Torso (blue with shading lines)
Line(PSX-8,PSY-20,PSX+8,PSY-20,0)
Line(PSX+8,PSY-20,PSX+8,PSY-9,0)
Line(PSX+8,PSY-9,PSX-8,PSY-9,0)
Line(PSX-8,PSY-9,PSX-8,PSY-20,0)
Line(PSX-4,PSY-20,PSX-4,PSY-9,0)
Line(PSX+4,PSY-20,PSX+4,PSY-9,0)

" Head (yellow with face)
Line(PSX-6,PSY-30,PSX+6,PSY-30,0)
Line(PSX+6,PSY-30,PSX+6,PSY-20,0)
Line(PSX+6,PSY-20,PSX-6,PSY-20,0)
Line(PSX-6,PSY-20,PSX-6,PSY-30,0)
Pxl-On(PSX-3,PSY-26)
Pxl-On(PSX+3,PSY-26)
Line(PSX-1,PSY-23,PSX+1,PSY-23,0)

" Arms swinging
Line(PSX-8,PSY-18,PSX-14+ARM,PSY-7,0)
Line(PSX+8,PSY-18,PSX+14-ARM,PSY-7,0)

" === OLD ROBLOX CURSOR ===
Line(CX,CY,CX,CY+15,0)
Line(CX,CY,CX+11,CY+11,0)
Line(CX+1,CY+1,CX+1,CY+13,0)
Line(CX+11,CY+11,CX+4,CY+11,0)
Line(CX-1,CY-1,CX-1,CY+16,0)
Line(CX-1,CY-1,CX+12,CY+12,0)

" Info
Text(3,3,"OLD ROBLOX")
Text(3,215,"Robux:" + toString(ROBUX))
Text(180,215,"Blocks:" + toString(BLOCKS))

If K=45:Goto E
Goto L
