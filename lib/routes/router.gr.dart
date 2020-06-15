// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tiktok_clone/widgets/start_page.dart';
import 'package:tiktok_clone/widgets/landing_page.dart';
import 'package:tiktok_clone/screens/add_video_screen.dart';

abstract class Routes {
  static const startPage = '/';
  static const landingPage = '/landing-page';
  static const addVideoScreen = '/add-video-screen';
  static const all = {
    startPage,
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
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartPage(),
          settings: settings,
        );
      case Routes.landingPage:
        if (hasInvalidArgs<LandingPageArguments>(args)) {
          return misTypedArgsRoute<LandingPageArguments>(args);
        }
        final typedArgs =
            args as LandingPageArguments ?? LandingPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => LandingPage(tab: typedArgs.tab),
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

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LandingPage arguments holder class
class LandingPageArguments {
  final int tab;
  LandingPageArguments({this.tab = 0});
}
