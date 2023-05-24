import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_element/data/dummy_data.dart';
import 'package:space_element/utils/colors.dart';
import 'package:space_element/utils/size_config.dart';
import 'package:space_element/widgets/duel_text.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ScrollController planetTxtController = ScrollController();
  late PageController planetController;
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();

    planetController = PageController();

    // Listen to the scroll events of controller1
    planetTxtController.addListener(() {
      if (planetTxtController.position.userScrollDirection ==
              ScrollDirection.forward ||
          planetTxtController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        // Update the scroll position of controller2
        planetController.jumpTo(planetTxtController.offset);
      }
    });

    // Listen to the scroll events of controller2
    planetController.addListener(() {
      if (planetController.position.userScrollDirection ==
              ScrollDirection.forward ||
          planetController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        // Update the scroll position of controller1
        planetTxtController.jumpTo(planetController.offset);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    planetController.dispose();
    planetTxtController.dispose();
    tabController.dispose();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: SizeConfig.screenHeight, // Responsive height
          width: SizeConfig.screenWidth, // Responsive width
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/assets/images/home_bg.png'),
            ),
          ),
          child: FrostedBottomBar(
            bottom: 0,
            width: SizeConfig.screenWidth,
            bottomBarColor: bottomNavBarColor.withOpacity(0.2),
            sigmaX: 2,
            sigmaY: 2,
            hideOnScroll: true,
            body: (context, controller) => TabBarView(
                controller: tabController,
                dragStartBehavior: DragStartBehavior.down,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical *
                              1.6, // Responsive padding
                          left: SizeConfig.safeBlockHorizontal *
                              1.6, // Responsive padding
                          right: SizeConfig.safeBlockHorizontal *
                              10, // Responsive padding
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
                                  firstTxtFontSize:
                                      SizeConfig.safeBlockHorizontal * 6,
                                  lastTxtFontSize:
                                      SizeConfig.safeBlockHorizontal * 6,
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
                        height: SizeConfig.safeBlockVertical * 4.5,
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
                                      width:
                                          SizeConfig.safeBlockHorizontal * 2.6,
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
                      const SizedBox(
                        height: 31,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 5,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: planetList.length,
                              controller: planetTxtController,
                              itemBuilder: (context, index) {
                                final bool isCenter = index == 1;
                                return Text(planetList[index],
                                    style: TextStyle(
                                      fontSize: isCenter ? 17 : 14,
                                      color: isCenter
                                          ? whiteColor
                                          : whiteColor.withOpacity(0.6),
                                      fontFamily: "Mark",
                                    ));
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 32.5),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 45,
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: planetList.length,
                              physics: const BouncingScrollPhysics(),
                              controller: planetController,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  "lib/assets/images/earth.png",
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 12,
                            top: SizeConfig.safeBlockHorizontal * 1),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DuelText(
                                firstTxt: "Earth",
                                lastTxt: "\nPlanet",
                                firstTxtFontSize: 45,
                                lastTxtFontSize: 45,
                                firstTxtFontFamily: 'Gilroy',
                                lastTxtFontFamily: 'Mark',
                                lineHeight: 0.9,
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 1.5,
                              ),
                              Container(
                                width: 280,
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames.",
                                      style: TextStyle(
                                          fontFamily: 'Mark',
                                          fontSize: 12,
                                          color: whiteColor),
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.safeBlockVertical * 1.8,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "View more",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 15,
                                              color: whiteColor),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                CupertinoIcons.chevron_forward,
                                                color: whiteColor))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              controller: tabController,
              tabs: [
                TabsIcon(
                  icons: SvgPicture.asset(
                    "lib/assets/icons/explore.svg",
                    height: 27,
                    width: 27,
                    colorFilter: ColorFilter.mode(
                        currentPage == 0 ? whiteColor : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                ),
                TabsIcon(
                  icons: SvgPicture.asset(
                    "lib/assets/icons/planet.svg",
                    height: 27,
                    width: 27,
                    colorFilter: ColorFilter.mode(
                        currentPage == 1 ? whiteColor : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                ),
                TabsIcon(
                  icons: SvgPicture.asset(
                    "lib/assets/icons/person.svg",
                    height: 27,
                    width: 27,
                    colorFilter: ColorFilter.mode(
                        currentPage == 2 ? whiteColor : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
