import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  Color _backgroundColor = const Color(0xff2797ff);
  Color get backgroundColor => _backgroundColor;
  set backgroundColor(Color value) {
    _backgroundColor = value;
  }

  bool _paywallyearlyclick = false;
  bool get paywallyearlyclick => _paywallyearlyclick;
  set paywallyearlyclick(bool value) {
    _paywallyearlyclick = value;
  }

  bool _paywallmonthlyclick = false;
  bool get paywallmonthlyclick => _paywallmonthlyclick;
  set paywallmonthlyclick(bool value) {
    _paywallmonthlyclick = value;
  }

  Color _backgroundColorContainer1 = const Color(0xffffffff);
  Color get backgroundColorContainer1 => _backgroundColorContainer1;
  set backgroundColorContainer1(Color value) {
    _backgroundColorContainer1 = value;
  }

  Color _backgroundColorContainer2 = const Color(0xffffffff);
  Color get backgroundColorContainer2 => _backgroundColorContainer2;
  set backgroundColorContainer2(Color value) {
    _backgroundColorContainer2 = value;
  }

  Color _backgroundColorContainer3 = const Color(0xffffffff);
  Color get backgroundColorContainer3 => _backgroundColorContainer3;
  set backgroundColorContainer3(Color value) {
    _backgroundColorContainer3 = value;
  }

  Color _backgroundColorContainer4 = const Color(0xffffffff);
  Color get backgroundColorContainer4 => _backgroundColorContainer4;
  set backgroundColorContainer4(Color value) {
    _backgroundColorContainer4 = value;
  }

  Color _backgroundColorContainer5 = const Color(0xffffffff);
  Color get backgroundColorContainer5 => _backgroundColorContainer5;
  set backgroundColorContainer5(Color value) {
    _backgroundColorContainer5 = value;
  }

  Color _backgroundColorContainer6 = const Color(0xffffffff);
  Color get backgroundColorContainer6 => _backgroundColorContainer6;
  set backgroundColorContainer6(Color value) {
    _backgroundColorContainer6 = value;
  }

  Color _backgroundColorContainer7 = const Color(0xffffffff);
  Color get backgroundColorContainer7 => _backgroundColorContainer7;
  set backgroundColorContainer7(Color value) {
    _backgroundColorContainer7 = value;
  }

  Color _backgroundColorContainer8 = const Color(0xffffffff);
  Color get backgroundColorContainer8 => _backgroundColorContainer8;
  set backgroundColorContainer8(Color value) {
    _backgroundColorContainer8 = value;
  }

  Color _backgroundColorContainer9 = const Color(0xffffffff);
  Color get backgroundColorContainer9 => _backgroundColorContainer9;
  set backgroundColorContainer9(Color value) {
    _backgroundColorContainer9 = value;
  }

  double _progressvaluebar = 0.0;
  double get progressvaluebar => _progressvaluebar;
  set progressvaluebar(double value) {
    _progressvaluebar = value;
  }

  bool _flashcardBTN = false;
  bool get flashcardBTN => _flashcardBTN;
  set flashcardBTN(bool value) {
    _flashcardBTN = value;
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
