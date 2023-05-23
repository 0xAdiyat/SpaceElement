import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_element/utils/colors.dart';
import 'package:space_element/widgets/duel_text.dart';

import '../utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/assets/images/home_bg.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  left: 0.0,
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'lib/assets/icons/menu.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: SizeConfig.safeBlockHorizontal * 3,
                  child: DuelText(
                    firstTxt: 'Space',
                    lastTxt: 'Element',
                    firstTxtFontSize: 26,
                    lastTxtFontSize: 26,
                    firstTxtFontFamily: 'Gilroy',
                    lastTxtFontFamily: 'Mark',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
