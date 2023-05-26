import 'package:flutter/material.dart';
import 'package:space_element/utils/constants/ui_constants.dart';
import 'package:space_element/widgets/transparent_appbar.dart';

class ExploreScreen extends StatefulWidget {
  final String planetImg;
  final String planetName;
  const ExploreScreen(
      {Key? key, required this.planetImg, required this.planetName})
      : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.planetName,
      child: TransparentAppbar(
        bgImage: UIConst.images.bgExplore,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 70,
                right: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 1.5,
                  child: Image.asset(
                    widget.planetImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
