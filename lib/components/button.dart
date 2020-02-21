import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';

class ComponentButton extends PositionComponent with Tapable {
  ComponentButton(x, y) : super() {
    this.x = x;
    this.y = y;
    this.width = 81.0;
    this.height = 81.0;
    this.paint = Paint();
    this.paint.color = Color(0x99FFFFFF);
  }

  Paint paint;
  Function onButtonDown;
  Function onButtonUp;

  @override
  void render(Canvas c) {
    c.drawRect(toRect(), this.paint);
  }

  @override
  void update(double t) {

  }

  @override
  void onTapDown(TapDownDetails details) {
    onButtonDown?.call();
  }

  @override
  void onTapUp(TapUpDetails details) {
    onButtonUp?.call();
  }
}