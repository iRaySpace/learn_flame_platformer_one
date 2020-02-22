import 'dart:ui';

import 'package:flame/components/component.dart';

class ComponentEntity extends PositionComponent {
  ComponentEntity(x, y) : super() {
    this.x = x;
    this.y = y;
    _vx = 0.0;
    _vy = 0.0;
    width = 36.0;
    height = 36.0;
    gravity = 9.8;
    isGrounded = false;
    isJumping = false;
    Paint paint = Paint();
    paint.color = Color(0xFF00FF00);
    this._paint = paint;
  }

  Paint _paint;
  double _vx;
  double _vy;
  double gravity;
  bool isGrounded;
  bool isJumping;

  @override
  void render(Canvas c) {
    c.drawRect(toRect(), this._paint);
  }

  @override
  void update(double t) {
    if (isGrounded == true && isJumping == false) {
      this._vy = 0.0;
    } else {
      this._vy = this._vy + gravity;
    }
    this.x = this.x + (this._vx * t);
    this.y = this.y + (this._vy * t);
  }

  void moveBy(double x, double y) {
    this.x = this.x + x;
    this.y = this.y + y;
  }

  void setVelocity(double vx, double vy) {
    this._vx = vx;
    this._vy = vy;
  }

  void setVelocityX(double vx) {
    this._vx = vx;
  }

  void setVelocityY(double vy) {
    this._vy = vy;
  }
}