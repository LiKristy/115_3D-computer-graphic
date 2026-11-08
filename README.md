# 115_3D-computer-graphic
1. CGLine(float x1, float y1, float x2, float y2)
  使用 Bresenham's Line Algorithm。
  透過誤差值判斷下一個像素的位置，決定每次迭代時X或Y座標是否需要增加或減少。
<img width="335" height="236" alt="image" src="https://github.com/user-attachments/assets/a42dc4d2-be12-41f9-8679-3877462b8319" />

2. CGCircle(float x, float y, float r)
   使用 Midpoint Circle Algorithm。
   利用圓形的八對稱性，只需要計算其中一部分的像素位置，即可推算其他七個對稱位置。
<img width="320" height="254" alt="image" src="https://github.com/user-attachments/assets/b8df777a-14b6-4d5e-9ac3-b720e526205f" />

3. CGEllipse(float x, float y, float r1, float r2)
   使用 Midpoint Ellipse Algorithm。
   將橢圓繪製分成兩個區域(Region 1、Region 2），根據不同區域的斜率變化計算下一個像素的位置。
   <img width="379" height="273" alt="image" src="https://github.com/user-attachments/assets/f717e728-fd3f-4c06-8919-22d6e4075493" />

5. CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4)
   使用Cubic Bézier Curve。
   透過四個控制點計算曲線上的位置，使用Bernstein Polynomial進行參數化計算。
   <img width="289" height="236" alt="image" src="https://github.com/user-attachments/assets/3b086b74-10e3-49ac-96c1-cf18be280ca3" />

7. CGEraser(Vector3 p1, Vector3 p2)
   透過矩形範圍的座標計算，將指定區域內的像素重新繪製為背景色，達到橡皮擦的效果。
