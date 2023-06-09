import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_element/utils/constants/ui_constants.dart';

import '../utils/size_config.dart';
import 'duel_text.dart';

class TransparentAppbar extends StatelessWidget {
  final String bgImage;
  final Widget body;
  const TransparentAppbar({Key? key, required this.bgImage, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: DuelText(
            firstTxt: 'Space',
            lastTxt: 'Element',
            firstTxtFontSize: SizeConfig.safeBlockHorizontal * 6,
            lastTxtFontSize: SizeConfig.safeBlockHorizontal * 6,
            firstTxtFontFamily: UIConst.font.gilroy,
            lastTxtFontFamily: UIConst.font.mark,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              UIConst.images.menu,
              fit: BoxFit.cover,
            ),
          ),
        ),
        body: body,
      ),
    );
  }
}
