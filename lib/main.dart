import 'package:flame/position.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/util.dart';
import 'package:flame/gestures.dart';
import 'components/button.dart';
import 'components/entity.dart';

void main() async {
  runApp(PlatformerOne().widget);
  await Util().setLandscape();
  await Util().fullScreen(); 
}

class PlatformerOne extends Game with TapDetector {
  PlatformerOne() :
    _leftButton = ComponentButton(0.0, 0.0),
    _rightButton = ComponentButton(0.0, 0.0),
    _actionButton = ComponentButton(0.0, 0.0),
    _player = ComponentEntity(0.0, 0.0) {
      _initButtons();
    }
  
  final ComponentButton _leftButton;
  final ComponentButton _rightButton;
  final ComponentButton _actionButton;
  final ComponentEntity _player;

  @override
  void render(Canvas canvas) {
    _player.render(canvas);
    _leftButton.render(canvas);
    _rightButton.render(canvas);
    _actionButton.render(canvas);
  }

  @override
  void update(double t) {
    _player.update(t);
  }

  @override
  void resize(Size size) {
    _player.setByPosition(
      Position(10.0, size.height / 2));
    _leftButton.setByPosition(
      Position(0.0, size.height - _leftButton.height));
    _rightButton.setByPosition(
      Position(_leftButton.width + 9.0, size.height - _rightButton.height));
    _actionButton.setByPosition(
      Position(size.width - _actionButton.width, size.height - _actionButton.height));
  }

  @override
  void onTapDown(TapDownDetails details) {
    _leftButton.handleTapDown(details);
    _rightButton.handleTapDown(details);
    _actionButton.handleTapDown(details);
  }  

  @override
  void onTapUp(TapUpDetails details) {
    _leftButton.handleTapUp(details);
    _rightButton.handleTapUp(details);
    _actionButton.handleTapUp(details);
  }

  void _initButtons() {
    _leftButton.onButtonDown = () => _player.setVelocity(-200.0, 0.0);
    _rightButton.onButtonDown = () => _player.setVelocity(200.0, 0.0);
    // _actionButton.onPressed = () => _player.moveBy(0.0, -3.0);
    _leftButton.onButtonUp = () => _player.setVelocity(0.0, 0.0);
    _rightButton.onButtonUp = () => _player.setVelocity(0.0, 0.0);
  }
}