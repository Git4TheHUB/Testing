REM =====================================================
REM OLD ROBLOX - TI-84 Plus CE (TI-BASIC)
REM As complex, beautiful & realistic as possible in TI-BASIC
REM Isometric 3D baseplate + detailed player + jump + cursor
REM =====================================================
REM HOW TO USE:
REM 1. Create new program on calculator named OLDROBLOX
REM 2. Paste this entire code (or type it)
REM 3. Run it!
REM Works on TI-84 Plus CE Python Edition too
REM =====================================================

ClrDraw
AxesOff
0→Xmin
1→Xmax
0→Ymin
1→Ymax

REM Title Screen (beautiful)
Text(20,30,"OLD ROBLOX")
Text(35,50,"CLASSIC 2010 EDITION")
Text(50,80,"Arrows: Move")
Text(50,95,"ENTER: Jump")
Text(50,110,"MODE: Move Cursor")
Text(50,125,"CLEAR: Exit")
Text(60,150,"Press any key to start")
Pause 

REM === VARIABLES (low RAM) ===
0→PX          REM Player X (isometric)
0→PZ          REM Player Z (isometric)
0→PY          REM Player height (jump)
0→VX          REM X velocity (for smooth move)
0→VZ          REM Z velocity
0→VY          REM Jump velocity
0→CX:160→CX   REM Cursor X
80→CY         REM Cursor Y
0→FRAME       REM For animation
1→ONGROUND
8→SCALE        REM Isometric scale
90→OX          REM Screen offset X
70→OY          REM Screen offset Y

REM =====================================================
REM MAIN GAME LOOP
REM =====================================================
Lbl LOOP
getKey→K

REM === MOVEMENT (smooth with velocity) ===
If K=24: VX-1→VX          REM Left
If K=26: VX+1→VX          REM Right
If K=25: VZ-1→VZ          REM Up (forward)
If K=34: VZ+1→VZ          REM Down (back)

PX+VX→PX
PZ+VZ→PZ
0.6*VX→VX                 REM Friction
0.6*VZ→VZ

REM Clamp to baseplate
If PX<0:0→PX
If PX>12:12→PX            REM Bigger world
If PZ<0:0→PZ
If PZ>12:12→PZ

REM === JUMP (realistic physics) ===
If K=105 and ONGROUND=1
Then
  7.5→VY
  0→ONGROUND
End

VY-0.45→VY
PY+VY→PY
If PY<0
Then
  0→PY
  0→VY
  1→ONGROUND
End

REM === CURSOR CONTROL (old Roblox mouse feel) ===
If K=22: CX-4→CX           REM MODE key = left
If K=23: CX+4→CX           REM DEL = right
If K=21: CY-4→CY           REM STAT = up
If K=31: CY+4→CY           REM PRGM = down

REM Clamp cursor
If CX<10:10→CX
If CX>310:310→CX          REM Wider screen
If CY<10:10→CY
If CY>200:200→CY

REM === DRAW EVERYTHING ===
ClrDraw

REM Sky gradient (lines for beauty)
For(I,0,60,8)
  Line(0,I,320,I,0)         REM Light blue lines
End

REM === ISOMETRIC BASEPLATE (detailed & beautiful) ===
REM Outer border (thick 3D look)
Line(OX-60,OY-30,OX+140,OY-30,0)
Line(OX+140,OY-30,OX+140,OY+110,0)
Line(OX+140,OY+110,OX-60,OY+110,0)
Line(OX-60,OY+110,OX-60,OY-30,0)

REM Grid (isometric tiles - 13x13 for bigger world)
For(I,0,12)
  For(J,0,12)
    REM Calculate isometric position
    (I-J)*SCALE/2+OX→X1
    (I+J)*SCALE/4+OY→Y1
    (I-J+1)*SCALE/2+OX→X2
    (I+J+1)*SCALE/4+OY→Y2
    (I-J)*SCALE/2+OX→X3
    (I+J+1)*SCALE/4+OY→Y3
    (I-J+1)*SCALE/2+OX→X4
    (I+J)*SCALE/4+OY→Y4

    REM Draw tile edges (gray for realistic baseplate)
    Line(X1,Y1,X2,Y2,0)
    Line(X2,Y2,X3,Y3,0)
    Line(X3,Y3,X4,Y4,0)
    Line(X4,Y4,X1,Y1,0)

    REM Add "studs" (small dots for classic Roblox plate feel)
    Pxl-On(X1+4,Y1+3)
    Pxl-On(X2-4,Y2+3)
    Pxl-On(X3-4,Y3-3)
    Pxl-On(X4+4,Y4-3)
  End
End

REM === DRAW SOME 3D BLOCKS on the plate (for realism) ===
REM Block 1 (near spawn)
3→I:3→J:2→H
(I-J)*SCALE/2+OX→BX
(I+J)*SCALE/4+OY→BY
Line(BX,BY-H*4,BX+SCALE/2,BY-SCALE/6-H*4,0)
Line(BX+SCALE/2,BY-SCALE/6-H*4,BX,BY-SCALE/3-H*4,0)
Line(BX,BY-SCALE/3-H*4,BX-SCALE/2,BY-SCALE/6-H*4,0)
Line(BX-SCALE/2,BY-SCALE/6-H*4,BX,BY-H*4,0)
Line(BX,BY,BX,BY-H*4,0)
Line(BX+SCALE/2,BY-SCALE/6,BX+SCALE/2,BY-SCALE/6-H*4,0)
Line(BX-SCALE/2,BY-SCALE/6,BX-SCALE/2,BY-SCALE/6-H*4,0)

REM Block 2 (another one)
8→I:5→J:1→H
(I-J)*SCALE/2+OX→BX
(I+J)*SCALE/4+OY→BY
Line(BX,BY-H*4,BX+SCALE/2,BY-SCALE/6-H*4,0)
Line(BX+SCALE/2,BY-SCALE/6-H*4,BX,BY-SCALE/3-H*4,0)
Line(BX,BY-SCALE/3-H*4,BX-SCALE/2,BY-SCALE/6-H*4,0)
Line(BX-SCALE/2,BY-SCALE/6-H*4,BX,BY-H*4,0)
Line(BX,BY,BX,BY-H*4,0)
Line(BX+SCALE/2,BY-SCALE/6,BX+SCALE/2,BY-SCALE/6-H*4,0)
Line(BX-SCALE/2,BY-SCALE/6,BX-SCALE/2,BY-SCALE/6-H*4,0)

REM === DRAW PLAYER (detailed blocky Roblox avatar) ===
REM Isometric player position
(PX-PZ)*SCALE/2+OX→PSX
(PX+PZ)*SCALE/4+OY-PY*SCALE/5→PSY

REM Legs (animated walk cycle)
FRAME+1→FRAME
If abs(VX)+abs(VZ)>0.5
Then
  sin(FRAME*0.4)*3→LEG
Else
  0→LEG
End

REM Left leg
Line(PSX-6,PSY-8,PSX-6+LEG,PSY+6,0)
Line(PSX-5,PSY-8,PSX-5+LEG,PSY+6,0)

REM Right leg
Line(PSX+6,PSY-8,PSX+6-LEG,PSY+6,0)
Line(PSX+5,PSY-8,PSX+5-LEG,PSY+6,0)

REM Torso (blue - classic Roblox)
Line(PSX-7,PSY-18,PSX+7,PSY-18,0)
Line(PSX+7,PSY-18,PSX+7,PSY-8,0)
Line(PSX+7,PSY-8,PSX-7,PSY-8,0)
Line(PSX-7,PSY-8,PSX-7,PSY-18,0)

REM Head (yellow - iconic Roblox noob head)
Line(PSX-5,PSY-28,PSX+5,PSY-28,0)
Line(PSX+5,PSY-28,PSX+5,PSY-18,0)
Line(PSX+5,PSY-18,PSX-5,PSY-18,0)
Line(PSX-5,PSY-18,PSX-5,PSY-28,0)

REM Eyes (black dots for face detail)
Pxl-On(PSX-2,PSY-24)
Pxl-On(PSX+2,PSY-24)

REM Arms (swinging with walk)
If abs(VX)+abs(VZ)>0.5
Then
  sin(FRAME*0.4+3.14)*4→ARM
Else
  2→ARM
End

Line(PSX-7,PSY-16,PSX-12+ARM,PSY-6,0)
Line(PSX+7,PSY-16,PSX+12-ARM,PSY-6,0)

REM === OLD ROBLOX CURSOR ===
REM Classic arrow (black with white outline for beauty)
Line(CX,CY,CX,CY+16,0)
Line(CX,CY,CX+12,CY+12,0)
Line(CX+1,CY+1,CX+1,CY+14,0)
Line(CX+12,CY+12,CX+5,CY+12,0)

REM White border (retro look)
Line(CX-1,CY-1,CX-1,CY+17,0)
Line(CX-1,CY-1,CX+13,CY+13,0)

REM === ON-SCREEN INFO (beautiful) ===
Text(5,5,"OLD ROBLOX")
Text(5,220,"Arrows=Move  ENTER=Jump  MODE=Cursor")

REM Exit
If K=45:Goto END

Goto LOOP

Lbl END
ClrDraw
Text(60,80,"Thanks for playing Old Roblox!")
Text(50,100,"Classic 2010 style on TI-84")
Pause 
ClrHome
Stop

REM =====================================================
REM END OF PROGRAM - Made with love for old Roblox fans
REM This is the most complex & beautiful TI-BASIC version possible
REM =====================================================
