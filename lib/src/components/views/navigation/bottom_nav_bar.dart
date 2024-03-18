import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';

class BottomNavBarPhone extends StatefulWidget {
  final Function(int)? onTap;
  final int currentIndex;

  const BottomNavBarPhone({super.key, this.onTap, required this.currentIndex});

  @override
  State<BottomNavBarPhone> createState() => _BottomNavBarPhoneState();
}

class _BottomNavBarPhoneState extends State<BottomNavBarPhone> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85 + MediaQuery.paddingOf(context).bottom,
      child: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        mouseCursor: MouseCursor.defer,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/index1.svg',
              colorFilter:
                  const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset('assets/images/index1.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/index2.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/index2.svg',
              colorFilter:
                  const ColorFilter.mode(AppColors.greenShade, BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/index3.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/index3.svg',
              colorFilter:
                  const ColorFilter.mode(AppColors.greenShade, BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/index4.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/index4.svg',
              colorFilter:
                  const ColorFilter.mode(AppColors.greenShade, BlendMode.srcIn),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/index5.svg'),
            activeIcon: SvgPicture.asset(
              'assets/images/index5.svg',
              colorFilter:
                  const ColorFilter.mode(AppColors.greenShade, BlendMode.srcIn),
            ),
            label: '',
          ),
        ],
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.black,
        // showUnselectedLabels: true,
        // showSelectedLabels: true,
        iconSize: 24,
        selectedItemColor: AppColors.greenShade,
        unselectedItemColor: AppColors.white,
      ),
    );
  }
}
