import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/login_screen.dart';

class MessageScreen extends StatelessWidget {
  final bool loggedIn = false;
  @override
  Widget build(BuildContext context) {
    return loggedIn ? Container() : LoginScreen();
  }
}
