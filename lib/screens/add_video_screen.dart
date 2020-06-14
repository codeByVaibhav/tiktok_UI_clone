import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AddVideoScreen extends StatefulWidget {
  @override
  _AddVideoScreenState createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  CameraController _controller;
  List<CameraDescription> _cameras;
  int _selectedCamera = 0;
  int _noOfCameras;
  Color _iconColor = Color.fromARGB(180, 255, 255, 255);
  double _verticalPadding = 8.0;
  double _horizontalPadding = 8.0;
  double _iconSize = 35.0;

  _toggelCamera() async {
    if (_controller != null) {
      await _controller.dispose();
    }
    _selectedCamera = (_selectedCamera + 1) % _noOfCameras;
    _initCamera();
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  _initCamera() async {
    _cameras = await availableCameras();
    _noOfCameras = _cameras.length;
    _controller =
        CameraController(_cameras[_selectedCamera], ResolutionPreset.high);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          _cameraPreview(),
          _buttonsScreen(),
        ],
      ),
    );
  }

  Widget _cameraPreview() {
    if (_controller == null || !_controller.value.isInitialized) {
      return Container();
    } else {
      return SafeArea(
        child: CameraPreview(_controller),
      );
    }
  }

  _exitButton() {
    return IconButton(
      icon: Icon(
        Icons.clear,
        color: _iconColor,
        size: _iconSize,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  _cameraRecordButton() {
    return MaterialButton(
      elevation: 10.0,
      child: Icon(
        Icons.radio_button_unchecked,
        color: _iconColor,
        size: 100.0,
      ),
      onPressed: () => null,
    );
  }

  _cameraToggleButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              _selectedCamera == 0 ? Icons.camera_rear : Icons.camera_front,
              color: _iconColor,
              size: _iconSize,
            ),
            onPressed: _toggelCamera,
          ),
          Text(
            'Flip',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }

  _demoIcons(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: _iconColor,
              size: _iconSize,
            ),
            onPressed: () => null,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }

  _songButton() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.queue_music,
          color: _iconColor,
        ),
        SizedBox(width: 10),
        Text('Sounds'),
      ],
    );
  }

  _top() {
    return Container(
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _exitButton(),
          _songButton(),
          _cameraToggleButton(),
        ],
      ),
    );
  }

  _middle() {
    return Expanded(
      child: Container(
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              children: <Widget>[
                // speed
                _demoIcons(Icons.shutter_speed, 'Speed'),
                // beauty
                _demoIcons(Icons.face, 'Beautify'),
                // filters
                _demoIcons(Icons.movie_filter, 'Filters'),
                // timer
                _demoIcons(Icons.timer_off, 'Timer'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _bottom() {
    return Container(
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _cameraRecordButton(),
        ],
      ),
    );
  }

  _buttonsScreen() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _top(),
          _middle(),
          _bottom(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
