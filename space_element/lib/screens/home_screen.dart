import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:space_element/data/dummy_data.dart';
import 'package:space_element/utils/colors.dart';
import 'package:space_element/utils/constants/ui_constants.dart';
import 'package:space_element/utils/size_config.dart';
import 'package:space_element/widgets/duel_text.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';

import '../widgets/custom_icon_tab_bar.dart';
import '../widgets/transparent_appbar.dart';
import 'explore_screen.dart';

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
    tabController = TabController(length: 3, vsync: this);
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
    return TransparentAppbar(
      bgImage: UIConst.images.bgHome,
      body: FrostedBottomBar(
        bottom: -3,
        alignment: Alignment.bottomCenter,
        width: SizeConfig.screenWidth,
        bottomBarColor: bottomNavBarColor.withOpacity(0.5),
        sigmaX: UIConst.sigmaXY.frostedBar,
        sigmaY: UIConst.sigmaXY.frostedBar,
        hideOnScroll: true,
        body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.5,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 70,
                        height: SizeConfig.safeBlockVertical * 4.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: UIConst.sigmaXY.glassSearchBar,
                                sigmaY: UIConst.sigmaXY.glassSearchBar),
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
                                        fontSize: UIConst.constSize.font12,
                                        color: whiteColor.withOpacity(0.5),
                                        fontFamily: UIConst.font.mark,
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
                        height: SizeConfig.safeBlockVertical * 3,
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
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: isCenter ? 17 : 14,
                                      color: isCenter
                                          ? whiteColor
                                          : whiteColor.withOpacity(0.6),
                                      fontFamily: UIConst.font.mark,
                                    ));
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                  width: SizeConfig.blockSizeHorizontal * 32),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 44,
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: planetList.length,
                              physics: const BouncingScrollPhysics(),
                              controller: planetController,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ExploreScreen(
                                          planetImg: UIConst
                                              .planetImgList[index]['planet'],
                                          planetName:
                                              UIConst.planetImgList[index]
                                                  ['planetName'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    flightShuttleBuilder: (flightContext,
                                        animation,
                                        flightDirection,
                                        fromHeroContext,
                                        toHeroContext) {
                                      final Hero toHero =
                                          toHeroContext.widget as Hero;
                                      return ScaleTransition(
                                        scale: animation.drive(Tween<double>(
                                            begin: 0.5, end: 1.0)),
                                        child: toHero.child,
                                      );
                                    },
                                    tag: UIConst.planetImgList[index]
                                        ['planetName'],
                                    child: Image.asset(
                                      UIConst.planetImgList[index]['planet'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 11,
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
                                firstTxtFontSize: UIConst.constSize.font45,
                                lastTxtFontSize: UIConst.constSize.font45,
                                firstTxtFontFamily: UIConst.font.gilroy,
                                lastTxtFontFamily: UIConst.font.mark,
                                lineHeight: 0.85,
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 1,
                              ),
                              Container(
                                width: 280,
                                padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 1),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames.",
                                      style: TextStyle(
                                          fontFamily: UIConst.font.mark,
                                          fontSize: UIConst.constSize.font12,
                                          color: whiteColor),
                                    ),
                                    SizedBox(
                                      height:
                                          SizeConfig.safeBlockVertical * 1.8,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "View more",
                                          style: TextStyle(
                                              fontFamily: UIConst.font.gilroy,
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
                  )
                ],
              ),
              const Center(
                  child: Text("explore",
                      style: TextStyle(fontSize: 20, color: Colors.white))),
              const Center(
                  child: Text("user",
                      style: TextStyle(fontSize: 20, color: Colors.white))),
            ]),
        child: CustomIconTabBar(
            tabController: tabController, currentPage: currentPage),
      ),
    );
  }
}
