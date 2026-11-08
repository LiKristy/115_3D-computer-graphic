# 115_3D-computer-graphic
1. CGLine(float x1, float y1, float x2, float y2)
  使用 Bresenham's Line Algorithm。
  透過誤差值（Error Term）判斷下一個像素的位置，決定每次迭代時 X 或 Y 座標是否需要增加或減少。
2. CGCircle(float x, float y, float r)
   使用 Midpoint Circle Algorithm。
   利用圓形的八對稱性，只需要計算其中一部分的像素位置，即可推算其他七個對稱位置。
3. CGEllipse(float x, float y, float r1, float r2)
   使用 Midpoint Ellipse Algorithm（中點橢圓演算法）。
   將橢圓繪製分成兩個區域（Region 1、Region 2），根據不同區域的斜率變化計算下一個像素的位置。
4. CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)
   使用 Cubic Bézier Curve。
   透過四個控制點計算曲線上的位置，使用 Bernstein Polynomial（伯恩斯坦多項式）進行參數化計算。
6. CGEraser(Vector3 p1, Vector3 p2)
   透過矩形範圍的座標計算，將指定區域內的像素重新繪製為背景色。
