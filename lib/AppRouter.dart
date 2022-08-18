import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navkey = GlobalKey();
  static NavigateToWidgetReplacement(Widget widget) {
    Navigator.of(navkey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return widget;
    })));
  }

  static NavigateToWidget(Widget widget) {
    Navigator.of(navkey.currentContext!)
        .push(MaterialPageRoute(builder: ((context) {
      return widget;
    })));
  }

  static popRoute() {
    Navigator.of(navkey.currentContext!).pop();
  }
}
