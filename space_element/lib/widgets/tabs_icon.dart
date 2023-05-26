import 'package:flutter/cupertino.dart';

class TabsIcon extends StatelessWidget {
  final double height;
  final double width;
  final Widget icons;

  const TabsIcon(
      {Key? key, this.height = 70, this.width = 50, required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: icons,
      ),
    );
  }
}
