import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_element/data/dummy_data.dart';
import 'package:space_element/utils/colors.dart';
import 'package:space_element/utils/size_config.dart';
import 'package:space_element/widgets/duel_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        height: SizeConfig.screenHeight, // Responsive height
        width: SizeConfig.screenWidth, // Responsive width
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/home_bg.png'),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 1.6, // Responsive padding
                  left: SizeConfig.safeBlockHorizontal *
                      1.6, // Responsive padding
                  right:
                      SizeConfig.safeBlockHorizontal * 10, // Responsive padding
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'lib/assets/icons/menu.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: DuelText(
                          firstTxt: 'Space',
                          lastTxt: 'Element',
                          firstTxtFontSize: SizeConfig.safeBlockHorizontal * 6,
                          lastTxtFontSize: SizeConfig.safeBlockHorizontal * 6,
                          firstTxtFontFamily: 'Gilroy',
                          lastTxtFontFamily: 'Mark',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2.6,
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 70,
                height: SizeConfig.safeBlockVertical * 5.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY:
                            5), // Adjust the sigma values for desired blur intensity
                    child: Container(
                      color: whiteColor.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              CupertinoIcons.search,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 2.6,
                            ),
                            Text(
                              "Search your favorite planet",
                              style: TextStyle(
                                fontSize: 12,
                                color: whiteColor.withOpacity(0.5),
                                fontFamily: "Mark",
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: planetList.length,
                  itemBuilder: (context, index) {
                    final bool isCenter = index == 1;
                    return Text(planetList[index],
                        style: TextStyle(
                          fontSize: isCenter ? 17 : 13,
                          color: isCenter
                              ? whiteColor
                              : whiteColor.withOpacity(0.6),
                          fontFamily: "Mark",
                        ));
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(width: SizeConfig.blockSizeHorizontal * 35),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('lib/assets/images/earth.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
