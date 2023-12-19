import 'package:flutter/material.dart';
import 'package:firebase_auth_youtube/core/image_constant.dart';
import 'package:firebase_auth_youtube/core/size_utils.dart';
import 'package:firebase_auth_youtube/theme/theme_helper.dart';
import 'package:firebase_auth_youtube/widgets/custom_image_view.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({Key? key, this.onChanged}) : super(key: key);

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeOnsecondarycontainer,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSwordOnsecondarycontainer,
      activeIcon: ImageConstant.imgSwordOnprimarycontainer,
      type: BottomBarEnum.Swordonsecondarycontainer,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgGame,
      activeIcon: ImageConstant.imgGameprimory,
      type: BottomBarEnum.Game,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgAccount,
      activeIcon: ImageConstant.imgAccountprimory,
      type: BottomBarEnum.Account,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.h),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.indigo9001e,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              -2,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 109, 82, 219)),
        unselectedIconTheme: IconThemeData(color: Color(0XFF91A5C4)),
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 28.adaptSize,
              width: 28.adaptSize,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 28.adaptSize,
              width: 28.adaptSize,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          _handleNavigation(index);
        },
      ),
    );
  }

  void _handleNavigation(int index) {
    widget.onChanged?.call(bottomMenuList[index].type);
    setState(() {
      selectedIndex = index;
    });
  }
}

// Enum and Model classes for BottomBar
enum BottomBarEnum {
  Home,
  Swordonsecondarycontainer,
  Game,
  Account,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;
  String activeIcon;
  BottomBarEnum type;
}
