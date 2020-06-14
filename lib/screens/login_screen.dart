import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: width * 0.3,
              ),
              onPressed: () => null,
              child: Text('Login'),
              color: Colors.pink,
              textColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.3),
              child: Divider(
                color: Colors.grey,
                height: 40.0,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: MediaQuery.of(context).size.width * 0.3,
              ),
              onPressed: () => null,
              child: Text('Signup'),
              color: Colors.pink,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
