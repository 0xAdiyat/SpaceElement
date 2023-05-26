import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_element/widgets/tabs_icon.dart';

import '../utils/colors.dart';
import '../utils/constants/ui_constants.dart';

class CustomIconTabBar extends StatelessWidget {
  const CustomIconTabBar({
    super.key,
    required this.tabController,
    required this.currentPage,
  });

  final TabController tabController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
      controller: tabController,
      tabs: [
        TabsIcon(
          icons: SvgPicture.asset(
            "lib/assets/icons/explore.svg",
            height: UIConst.constSize.tabsIconSize,
            width: UIConst.constSize.tabsIconSize,
            colorFilter: ColorFilter.mode(
                currentPage == 0 ? whiteColor : unselectedIconColor,
                BlendMode.srcIn),
          ),
        ),
        TabsIcon(
          icons: SvgPicture.asset(
            "lib/assets/icons/planet.svg",
            height: UIConst.constSize.tabsIconSize,
            width: UIConst.constSize.tabsIconSize,
            colorFilter: ColorFilter.mode(
                currentPage == 1 ? whiteColor : unselectedIconColor,
                BlendMode.srcIn),
          ),
        ),
        TabsIcon(
          icons: SvgPicture.asset(
            "lib/assets/icons/person.svg",
            height: UIConst.constSize.tabsIconSize,
            width: UIConst.constSize.tabsIconSize,
            colorFilter: ColorFilter.mode(
                currentPage == 2 ? whiteColor : unselectedIconColor,
                BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
