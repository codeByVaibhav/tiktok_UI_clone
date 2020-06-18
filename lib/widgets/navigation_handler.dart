import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationHandler extends StatelessWidget {
  final Widget child;
  final MethodChannel _androidAppRetain = MethodChannel("app_retain");
  NavigationHandler({@required this.child});

  Future<bool> _onBackButtonPressed(BuildContext context) {
    if (Platform.isAndroid) {
      if (Navigator.of(context).canPop()) {
        return Future.value(true);
      } else {
        _androidAppRetain.invokeMethod("sendToBackground");
        return Future.value(false);
      }
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: child,
    );
  }
}
