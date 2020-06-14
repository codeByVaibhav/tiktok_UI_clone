import 'package:auto_route/auto_route.dart';
import 'package:tiktok_clone/routes/router.gr.dart';

// void gotoHomeScreen() =>
//     ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.homeScreen);

// void gotoSearchScreen() =>
//     ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.searchScreen);

// void gotoMessagesScreen() =>
//     ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.messageScreen);

// void gotoProfileScreen() =>
//     ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.profileScreen);

void gotoAddVideoScreen() =>
    ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.addVideoScreen);

void gotoLandingPage() =>
    ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.landingPage);
