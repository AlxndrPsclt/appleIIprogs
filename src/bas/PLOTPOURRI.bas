1  REM    ******************
2  REM    *                *
3  REM    *   PLOTPOURRI   *
4  REM    *   S COTTRELL   *
5  REM    *   SEPT  1979   *
6  REM    *                *
7  REM    ******************
8  REM 
9  REM 
10  TEXT 
20  HOME : INPUT "WHICH PLOT FIRST (1-10)?";PN
25  ON PN GOTO 30,40,50,60,70,80,90,100,110,120
30 X1 =  -4:X2 = 4:Y1 =  -4:Y2 = 4:ZS = 45:RZ = 1:PC = 3:BC = 0
35  DEF  FN Z(X) = ( COS(X *X +Y *Y) +1) * EXP( -(X *X +Y *Y)/6)
39  GOSUB 130
40 X1 =  -4:X2 = 4:Y1 =  -4:Y2 = 4:ZS = 12.5:RZ = 1:PC = 6:BC = 0
45  DEF  FN Z(X) = 1 + COS(X *Y)
49  GOSUB 130
50 X1 =  -6:X2 = 2:Y1 =  -5:Y2 = 1:ZS = 25:RZ = 2:PC = 0:BC = 3
55  DEF  FN Z(X) = ( - COS(X *X +Y *Y) -1) * EXP( -(X *X +Y *Y)/16) +1
59  GOSUB 130
60 X1 =  -200:X2 = 200:Y1 =  -100:Y2 = 200:ZS = 12.5:RZ = 2:PC = 0:BC = 7
65  DEF  FN Z(X) = 1 + COS((X +Y)/( LOG(X *X +Y ^4)))
69  GOSUB 130
70 X1 =  -20:X2 = 20:Y1 =  -20:Y2 = 20:ZS = 40:RZ = 2:PC = 0:BC = 3
75  DEF  FN Z(X) = ( COS(X *Y/ SQR(X *X +Y *Y)) -1) * EXP( -(X *X +Y *Y)/120)
79  GOSUB 130
80 X1 =  -5:X2 = 5:Y1 =  -5:Y2 = 5:ZS = 12.5:RZ = 2:PC = 0:BC = 7
85  DEF  FN Z(X) = 1 + COS((X +Y)/( LOG( ABS(X *Y +0.5))))
89  GOSUB 130
90 X1 =  -7:X2 = 7:Y1 =  -17.4:Y2 = 17.4:ZS = 50:RZ = 2:PC = 0:BC = 3
95  DEF  FN Z(X) = Y *X *X/(Y *Y +X *X *X *X) +0.4
99  GOSUB 130
100 X1 =  -3:X2 = 3:Y1 =  -3:Y2 = 3:ZS = 10:RZ = 1:PC = 2:BC = 0
105  DEF  FN Z(X) = Y *X *(X *X -Y *Y)/(X *X +Y *Y) +2
109  GOSUB 130
110 X1 =  -4:X2 = 6:Y1 =  -3:Y2 = 5.7:ZS = 32:RZ = 2:PC = 3:BC = 0
115  DEF  FN Z(X) = 3 * EXP( -( SQR(X *X +Y *Y))) +0.1 * COS(X *Y)
119  GOSUB 130
120 X1 =  -2:X2 = 3:Y1 =  -3:Y2 = 5.7:ZS = 80:RZ = 1:PC = 6:BC = 0
125  DEF  FN Z(X) =  SIN(X *Y) * EXP( -(X *X +Y *Y)/9) +.2
128  GOSUB 130
129  GOTO 30
130 NY = RZ *87:NX = RZ *50
140  HGR2 
150 DX = (X2 -X1)/NX:DY = (Y2 -Y1)/NY
160 H0 = 0
170 K1 = 58:K2 = Y2 -Y1:K3 = 90
172 K4 = 174:K5 = 191
200  FOR X = X1 TO X2  STEP DX
220 H0 = (X -X1)/(X2 -X1) *100:NH =  -1
240  FOR Y = Y1 TO Y2  STEP DY
250 ZZ =  FN Z(X)
260 V =  -ZZ *ZS -(Y -Y1)/K2 *K1 +K3 +H0
270 NH = NH +1
280 H = H0 +NH *K4/NY
290  IF V <0  OR V >K5 GOTO 330
300  HCOLOR= PC: HPLOT H,V: HCOLOR= BC: HPLOT H,V +1 TO H,K5
330  NEXT : NEXT 
340  FOR J = 0 TO 3: PRINT  CHR$(7): NEXT 
345  GET ST$: REM HIT A KEY TO CONTINUE
350  RETURN 