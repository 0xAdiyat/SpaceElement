import 'package:flutter/material.dart';

class EarthRotationWidget extends StatefulWidget {
  const EarthRotationWidget({super.key});

  @override
  _EarthRotationWidgetState createState() => _EarthRotationWidgetState();
}

class _EarthRotationWidgetState extends State<EarthRotationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Container(
        width: 200, // adjust the size as per your requirement
        height: 200,
        child: Image.asset(
          "lib/assets/images/earth.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
