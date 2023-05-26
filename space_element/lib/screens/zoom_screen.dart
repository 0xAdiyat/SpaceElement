import 'package:flutter/material.dart';
import 'package:space_element/utils/constants/ui_constants.dart';

class ZoomScreen extends StatefulWidget {
  @override
  _ZoomScreenState createState() => _ZoomScreenState();
}

class _ZoomScreenState extends State<ZoomScreen> {
  double _zoomLevel = 1.0;
  double _translateY = 0.0;
  double _translateX = 0.0;

  void _zoomIn() {
    setState(() {
      _zoomLevel += 0.5;
      _translateY = MediaQuery.of(context).size.height * 0.1;
      _translateX = MediaQuery.of(context).size.height * 0.1;
    });
  }

  void _zoomOut() {
    setState(() {
      _zoomLevel -= 0.1;
      _translateY = 0.0;
      _translateX = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoom Transition'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _zoomIn,
          onDoubleTap: _zoomOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.identity()
              ..scale(_zoomLevel, _zoomLevel)
              ..translate(0.0, _translateY)
              ..translate(0.0, _translateX),
            child: Image.asset(UIConst.planetImgList[0]['planet']),
          ),
        ),
      ),
    );
  }
}
