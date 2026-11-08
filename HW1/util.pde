public void CGLine(float x1, float y1, float x2, float y2) {
    // TODO HW1
    // You need to implement the "line algorithm" in this section.
    // You can use the function line(x1, y1, x2, y2); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    // For instance: drawPoint(114, 514, color(255, 0, 0)); signifies drawing a red
    // point at (114, 514).

    /*
     stroke(0);
     noFill();
     line(x1,y1,x2,y2);
    */
    int x = round(x1);
    int y = round(y1);
    int xEnd = round(x2);
    int yEnd = round(y2);

    int dx = abs(xEnd - x);
    int dy = abs(yEnd - y);
    int sx = (x < xEnd) ? 1 : -1;
    int sy = (y < yEnd) ? 1 : -1;
    int err = dx - dy;

    while (true) {
        drawPoint(x, y, color(0));

        if (x == xEnd && y == yEnd) {
            break;
        }

        int e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x += sx;
        }
        if (e2 < dx) {
            err += dx;
            y += sy;
        }
    }
}

public void CGCircle(float x, float y, float r) {
    // TODO HW1
    // You need to implement the "circle algorithm" in this section.
    // You can use the function circle(x, y, r); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    circle(x,y,r*2);
    */
    
    int cx = round(x);
    int cy = round(y);
    int radius = max(0, round(abs(r)));

    int px = 0;
    int py = radius;
    int decision = 1 - radius;

    while (px <= py) {
        drawPoint(cx + px, cy + py, color(0));
        drawPoint(cx - px, cy + py, color(0));
        drawPoint(cx + px, cy - py, color(0));
        drawPoint(cx - px, cy - py, color(0));
        drawPoint(cx + py, cy + px, color(0));
        drawPoint(cx - py, cy + px, color(0));
        drawPoint(cx + py, cy - px, color(0));
        drawPoint(cx - py, cy - px, color(0));

        px++;
        if (decision < 0) {
            decision += 2 * px + 1;
        } else {
            py--;
            decision += 2 * (px - py) + 1;
        }
    }
}

public void CGEllipse(float x, float y, float r1, float r2) {
    // TODO HW1
    // You need to implement the "ellipse algorithm" in this section.
    // You can use the function ellipse(x, y, r1,r2); to verify the correct answer.
    // However, remember to comment out the function before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    ellipse(x,y,r1*2,r2*2);
    */
    int cx = round(x);
    int cy = round(y);
    int rx = max(0, round(abs(r1)));
    int ry = max(0, round(abs(r2)));

    if (rx == 0 && ry == 0) {
        drawPoint(cx, cy, color(0));
        return;
    }
    if (rx == 0) {
        CGLine(cx, cy - ry, cx, cy + ry);
        return;
    }
    if (ry == 0) {
        CGLine(cx - rx, cy, cx + rx, cy);
        return;
    }

    long rx2 = (long) rx * rx;
    long ry2 = (long) ry * ry;
    long twoRx2 = 2L * rx2;
    long twoRy2 = 2L * ry2;

    long px = 0;
    long py = twoRx2 * ry;

    int dx = 0;
    int dy = (int) (twoRx2 * ry);

    // Region 1
    double p = ry2 - rx2 * ry + 0.25 * rx2;
    int ex = 0;
    int ey = ry;

    while (dx < dy) {
        drawPoint(cx + ex, cy + ey, color(0));
        drawPoint(cx - ex, cy + ey, color(0));
        drawPoint(cx + ex, cy - ey, color(0));
        drawPoint(cx - ex, cy - ey, color(0));

        ex++;
        dx += twoRy2;
        if (p < 0) {
            p += ry2 + dx;
        } else {
            ey--;
            dy -= twoRx2;
            p += ry2 + dx - dy;
        }
    }

    // Region 2
    p = ry2 * (ex + 0.5) * (ex + 0.5)
        + rx2 * (ey - 1.0) * (ey - 1.0)
        - rx2 * ry2;

    while (ey >= 0) {
        drawPoint(cx + ex, cy + ey, color(0));
        drawPoint(cx - ex, cy + ey, color(0));
        drawPoint(cx + ex, cy - ey, color(0));
        drawPoint(cx - ex, cy - ey, color(0));

        ey--;
        dy -= twoRx2;
        if (p > 0) {
            p += rx2 - dy;
        } else {
            ex++;
            dx += twoRy2;
            p += rx2 - dy + dx;
        }
    }

}

public void CGCurve(Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4) {
    // TODO HW1
    // You need to implement the "bezier curve algorithm" in this section.
    // You can use the function bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x,
    // p4.y); to verify the correct answer.
    // However, remember to comment out before you submit your homework.
    // Otherwise, you will receive a score of 0 for this part.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).

    /*
    stroke(0);
    noFill();
    bezier(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y,p4.x,p4.y);
    */
    final int STEPS = 1000;

    for (int i = 0; i <= STEPS; i++) {
        float t = (float) i / STEPS;
        float u = 1.0f - t;

        float b0 = u * u * u;
        float b1 = 3.0f * u * u * t;
        float b2 = 3.0f * u * t * t;
        float b3 = t * t * t;

        float px = b0 * p1.x + b1 * p2.x + b2 * p3.x + b3 * p4.x;
        float py = b0 * p1.y + b1 * p2.y + b2 * p3.y + b3 * p4.y;

        drawPoint(px, py, color(0));
    }
}

public void CGEraser(Vector3 p1, Vector3 p2) {
    // TODO HW1
    // You need to erase the scene in the area defined by points p1 and p2 in this
    // section.
    // p1 ------
    // |       |
    // |       |
    // ------ p2
    // The background color is color(250);
    // You can use the mouse wheel to change the eraser range.
    // Utilize the function drawPoint(x, y, color) to apply color to the pixel at
    // coordinates (x, y).
    int left = floor(min(p1.x, p2.x));
    int right = ceil(max(p1.x, p2.x));
    int top = floor(min(p1.y, p2.y));
    int bottom = ceil(max(p1.y, p2.y));

    color backgroundColor = color(250);

    for (int py = top; py <= bottom; py++) {
        for (int px = left; px <= right; px++) {
            drawPoint(px, py, backgroundColor);
        }
    }
}

public void drawPoint(float x, float y, color c) {
    stroke(c);
    point(x, y);
}

public float distance(Vector3 a, Vector3 b) {
    Vector3 c = a.sub(b);
    return sqrt(Vector3.dot(c, c));
}
