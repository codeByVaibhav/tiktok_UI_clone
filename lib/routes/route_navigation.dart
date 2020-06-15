import 'package:auto_route/auto_route.dart';
import 'package:tiktok_clone/routes/router.gr.dart';

int lastTab = 0;

void gotoAddVideoScreen() =>
    ExtendedNavigator.ofRouter<Router>().popAndPushNamed(Routes.addVideoScreen);

void exitCameraScreen() =>
    ExtendedNavigator.ofRouter<Router>().popAndPushNamed(Routes.landingPage,
        arguments: LandingPageArguments(tab: lastTab));
