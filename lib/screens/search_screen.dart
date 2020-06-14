import 'package:flutter/material.dart';
import 'package:tiktok_clone/tik_tok_icons_icons.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Icon(
                      TikTokIcons.search,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                  ),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black, fontSize: 18.0),
                cursorWidth: 2.0,
                cursorRadius: Radius.circular(5.0),
                cursorColor: Color.fromARGB(250, 200, 200, 230),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
