ClrDraw
AxesOff
0→Xmin:1→Xmax
0→Ymin:1→Ymax

0→PX:0→PZ:0→PY:0→VX:0→VZ:0→VY:160→CX:90→CY:0→F:1→G:9→S:85→OX:65→OY:0→CH:42

Lbl L
getKey→K

If K=24:VX-1→VX
If K=26:VX+1→VX
If K=25:VZ-1→VZ
If K=34:VZ+1→VZ
PX+VX→PX:PZ+VZ→PZ:VX*.7→VX:VZ*.7→VZ

If PX<0:0→PX
If PX>12:12→PX
If PZ<0:0→PZ
If PZ>12:12→PZ

If K=105 and G=1
Then
  7→VY:0→G
End
VY-.4→VY
PY+VY→PY
If PY<0
Then
  0→PY:0→VY:1→G
End

If K=22:S+1→S:CH+2→CH
If K=23:S-1→S:CH-2→CH
If S<6:6→S
If S>16:16→S
If CH<28:28→CH
If CH>60:60→CH

If K=22:CX-3→CX
If K=23:CX+3→CX
If K=31:CY-3→CY
If K=32:CY+3→CY
If CX<8:8→CX
If CX>312:312→CX
If CY<8:8→CY
If CY>200:200→CY

ClrDraw

For(I,0,50,6):Line(0,I,320,I,0):End

Line(OX-55,OY-28,OX+145,OY-28,0)
Line(OX+145,OY-28,OX+145,OY+115,0)
Line(OX+145,OY+115,OX-55,OY+115,0)
Line(OX-55,OY+115,OX-55,OY-28,0)

For(I,0,12)
For(J,0,12)
(I-J)*S/2+OX→A
(I+J)*S/4+OY→B
(I-J+1)*S/2+OX→C
(I+J+1)*S/4+OY→D
(I-J)*S/2+OX→E
(I+J+1)*S/4+OY→F
(I-J+1)*S/2+OX→G
(I+J)*S/4+OY→H
Line(A,B,C,D,0)
Line(C,D,E,F,0)
Line(E,F,G,H,0)
Line(G,H,A,B,0)
Pxl-On(A+2,B+1)
Pxl-On(C-2,D+1)
Pxl-On(E-2,F-1)
Pxl-On(G+2,H-1)
End
End

For(B,1,3)
If B=1:3→I:2→J:3→H
If B=2:8→I:6→J:2→H
If B=3:5→I:9→J:4→H
(I-J)*S/2+OX→A
(I+J)*S/4+OY→B
Line(A,B-H*4,A+S/2,B-S/4-H*4,0)
Line(A+S/2,B-S/4-H*4,A,B-S/2-H*4,0)
Line(A,B-S/2-H*4,A-S/2,B-S/4-H*4,0)
Line(A-S/2,B-S/4-H*4,A,B-H*4,0)
Line(A,B,A,B-H*4,0)
Line(A+S/2,B-S/4,A+S/2,B-S/4-H*4,0)
Line(A-S/2,B-S/4,A-S/2,B-S/4-H*4,0)
End

(PX-PZ)*S/2+OX→X
(PX+PZ)*S/4+OY-PY*S/4→Y

F+1→F
If abs(VX)+abs(VZ)>0.6
Then
  sin(F*.4)*3→L
  sin(F*.4+3.14)*4→R
Else
  0→L:.5→R
End

Line(X-5,Y-7,X-5+L,Y+5,0)
Line(X-4,Y-7,X-4+L,Y+5,0)
Line(X+5,Y-7,X+5-L,Y+5,0)
Line(X+4,Y-7,X+4-L,Y+5,0)

Line(X-6,Y-16,X+6,Y-16,0)
Line(X+6,Y-16,X+6,Y-7,0)
Line(X+6,Y-7,X-6,Y-7,0)
Line(X-6,Y-7,X-6,Y-16,0)
Line(X-2,Y-16,X-2,Y-7,0)
Line(X+2,Y-16,X+2,Y-7,0)

Line(X-4,Y-24,X+4,Y-24,0)
Line(X+4,Y-24,X+4,Y-16,0)
Line(X+4,Y-16,X-4,Y-16,0)
Line(X-4,Y-16,X-4,Y-24,0)
Pxl-On(X-1,Y-21)
Pxl-On(X+1,Y-21)

Line(X-6,Y-14,X-10+R,Y-5,0)
Line(X+6,Y-14,X+10-R,Y-5,0)

Line(CX,CY,CX,CY+13,0)
Line(CX,CY,CX+9,CY+9,0)
Line(CX+1,CY+1,CX+1,CY+11,0)
Line(CX+9,CY+9,CX+3,CY+9,0)
Line(CX-1,CY-1,CX-1,CY+14,0)
Line(CX-1,CY-1,CX+10,CY+10,0)

If K=45:Goto E
Goto L

Lbl E
ClrDraw
Pause 
ClrHome
Stop
