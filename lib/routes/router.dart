import 'package:auto_route/auto_route_annotations.dart';
import 'package:tiktok_clone/screens/add_video_screen.dart';
import 'package:tiktok_clone/widgets/landing_page.dart';
import 'package:tiktok_clone/widgets/start_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartPage startPage;
  LandingPage landingPage;
  AddVideoScreen addVideoScreen;
}
