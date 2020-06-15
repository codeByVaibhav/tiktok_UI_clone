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
  final Color _iconColor = Color.fromARGB(180, 255, 255, 255);
  final double _verticalPadding = 8.0;
  final double _horizontalPadding = 8.0;
  final double _iconSize = 35.0;

  @override
  void initState() {
    super.initState();
    availableCameras().then((deviceCameras) {
      _cameras = deviceCameras;
      _initCamera();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          _cameraPreview,
          _buttonsScreen,
        ],
      ),
    );
  }

  /// [Not used]
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // void showInSnackBar(String message) {
  //   _scaffoldKey.currentState.showSnackBar(SnackBar(
  //     content: Text(message),
  //     backgroundColor: Colors.green,
  //   ));
  // }

  _toggelCamera() {
    _selectedCamera = (_selectedCamera + 1) % _cameras.length;
    _initCamera();
  }

  _initCamera() {
    _controller =
        CameraController(_cameras[_selectedCamera], ResolutionPreset.high);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Widget _demoIcon(IconData icon, String text) {
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

  Widget get _cameraPreview {
    if (_controller == null) return Container();
    if (!_controller.value.isInitialized) return Container();
    return SafeArea(child: CameraPreview(_controller));
  }

  Widget get _buttonsScreen {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _top,
          _middle,
          _bottom,
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget get _top => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _exitButton,
            _songButton,
            _cameraToggleButton,
          ],
        ),
      );

  Widget get _middle => Expanded(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  _demoIcon(Icons.shutter_speed, 'Speed'),
                  _demoIcon(Icons.face, 'Beautify'),
                  _demoIcon(Icons.movie_filter, 'Filters'),
                  _demoIcon(Icons.timer_off, 'Timer'),
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _bottom => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _cameraRecordButton,
          ],
        ),
      );

  Widget get _exitButton => IconButton(
        icon: Icon(
          Icons.clear,
          color: _iconColor,
          size: _iconSize,
        ),
        onPressed: Navigator.of(context).pop,
      );

  Widget get _cameraToggleButton => Padding(
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
  Widget get _songButton => Row(
        children: <Widget>[
          Icon(
            Icons.queue_music,
            color: _iconColor,
          ),
          SizedBox(width: 10),
          Text('Sounds'),
        ],
      );

  Widget get _cameraRecordButton => MaterialButton(
        elevation: 10.0,
        child: Icon(
          Icons.radio_button_unchecked,
          color: _iconColor,
          size: 100.0,
        ),
        onPressed: () => null,
      );
}
