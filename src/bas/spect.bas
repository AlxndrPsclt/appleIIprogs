

NEW
10  GR
20  DIM A(40)
30  COLOR=1
40  FOR K=0 TO 39
50   A(K)=10+RND(1) * 20
60   VLIN A(K),39 AT K
70  NEXT K

90    X=RND(1)*38
100    N=A(X)+(2*RND(1)-1)*4
110    IF N<1 THEN N=1
120    IF N>38 THEN N=38
130    COLOR=N<A(X)
140    IF N<A(X) THEN VLIN N,A(X) AT X
150    IF N>A(X) THEN VLIN A(X),N AT X
160    A(X)=N
170 GOTO 90

180 END

