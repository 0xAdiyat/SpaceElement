class UIConst {
  static ({
    double frostedBar,
    double glassSearchBar,
  }) sigmaXY = (
    frostedBar: 2.0,
    glassSearchBar: 5.0,
  );

  static ({
    String mark,
    String gilroy,
  }) font = (
    mark: 'Mark',
    gilroy: 'Gilroy',
  );

  static ({
    double tabsIconSize,
    double font12,
    double font45,
  }) constSize = (
    tabsIconSize: 27,
    font12: 12,
    font45: 45,
  );

  static ({
    String bgHome,
    String bgExplore,
    String menu,
  }) images = (
    bgHome: "lib/assets/images/home_bg.png",
    bgExplore: "lib/assets/images/explore_bg.png",
    menu: "lib/assets/icons/menu.svg",
  );

  static List<Map<String, dynamic>> planetImgList = [
    {
      'planet': "lib/assets/images/earth.png",
      'planetName': "earth",
    },
  ];
}
