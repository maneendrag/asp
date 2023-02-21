import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfigService {
  double _screenWidth = 0;
  double _screenHeight = 0;
  double _blockWidth = 0;
  double _blockHeight = 0;

  double textMultiplier = 0;
  double imageSizeMultiplier = 0;
  double heightMultiplier = 0;
  double widthMultiplier = 0;
  bool isPortrait = true;
  bool isMobilePortrait = false;

  void init(
      BoxConstraints constraints, Orientation orientation) {
    // print("ORIENTation");
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

  }
}
