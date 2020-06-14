// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tiktok_clone/widgets/landing_page.dart';
import 'package:tiktok_clone/screens/add_video_screen.dart';

abstract class Routes {
  static const landingPage = '/';
  static const addVideoScreen = '/add-video-screen';
  static const all = {
    landingPage,
    addVideoScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LandingPage(),
          settings: settings,
        );
      case Routes.addVideoScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddVideoScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
