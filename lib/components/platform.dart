import 'dart:ui';
import 'package:flame/components/component.dart';

class ComponentPlatform extends PositionComponent {
  ComponentPlatform(x, y): super() {
    this.x = x;
    this.y = y;
    this.width = 480.0;
    this.height = 36.0;
    this.paint = Paint();
    this.paint.color = Color(0xFFFF00FF);
  }

  Paint paint;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(toRect(), this.paint);
  }

  @override
  void update(double t) {

  }
  
}
