import 'package:flutter/material.dart';
import 'package:tiktok_clone/tik_tok_icons_icons.dart';

class ActionsToolbar extends StatelessWidget {
  // full dimension of an action
  static const double actionWidgetSize = 60.0;

  // size of icon shown for social action
  static const double actionIconSize = 35.0;

  // the size of share social icon
  static const double shareActionIconSize = 25.0;

  // the size of profile image in the follow action
  static const double profileImageSize = 50.0;

  // the size of plus icon in the profile image in follow action
  static const double plusIconSize = 20.0;

  static const String imgUrl =
      'https://avatars1.githubusercontent.com/u/43314374?s=460&u=10544aa618c0bf5d24cebd4977489a09521e721f&v=4';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: MediaQuery.of(context).size.height * 0.55,
      // color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getFollowAction(),
          _getSocialAction(
              iconData: TikTokIcons.heart,
              title: '40.9m',
              iconColor: Color.fromARGB(255, 230, 0, 100)),
          _getSocialAction(iconData: TikTokIcons.chat_bubble, title: '5.9m'),
          _getSocialAction(
            iconData: TikTokIcons.reply,
            title: 'Share',
            isShare: true,
          ),
          _getMusicPlayerAction(),
        ],
      ),
    );
  }

  _getSocialAction({
    String title,
    IconData iconData,
    bool isShare = false,
    Color iconColor,
  }) {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: isShare ? shareActionIconSize : actionIconSize,
            color: iconColor ?? Colors.grey[300],
          ),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child:
                Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ],
      ),
    );
  }

  _getFollowAction() {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: <Widget>[
          _getProfilePicture(),
          _getPlusIcon(),
        ],
      ),
    );
  }

  _getProfilePicture() {
    return Positioned(
      left: (actionWidgetSize / 2) - (profileImageSize / 2),
      child: Container(
        height: profileImageSize,
        width: profileImageSize,
        padding: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(profileImageSize / 2),
        ),
        child: CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
      ),
    );
  }

  _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((actionWidgetSize / 2) - (plusIconSize / 2)),
      child: Container(
        width: plusIconSize, // plusIconSize = 20.0;
        height: plusIconSize, // PlusIconSize = 20.0;
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 43, 84),
            borderRadius: BorderRadius.circular(15.0)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 15.0,
        ),
      ),
    );
  }

  LinearGradient get musicGradient {
    return LinearGradient(colors: [
      Colors.grey[800],
      Colors.grey[900],
      Colors.grey[900],
      Colors.grey[800],
    ], stops: [
      0.0,
      0.4,
      0.6,
      1.0
    ], begin: Alignment.bottomLeft, end: Alignment.topRight);
  }

  _getMusicPlayerAction() {
    return Container(
      width: actionWidgetSize,
      height: actionWidgetSize,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(11.0),
            width: profileImageSize,
            height: profileImageSize,
            decoration: BoxDecoration(
              gradient: musicGradient,
              borderRadius: BorderRadius.circular(profileImageSize / 2),
            ),
            child: CircleAvatar(backgroundImage: NetworkImage(imgUrl)),
          ),
        ],
      ),
    );
  }
}
