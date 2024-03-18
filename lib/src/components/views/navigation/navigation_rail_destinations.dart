import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/src/components/utils/extensions.dart';

import '../../constants/colors.dart';

class NavigationRailDestinations extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const NavigationRailDestinations(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  State<NavigationRailDestinations> createState() =>
      _NavigationRailDestinationsState();
}

class _NavigationRailDestinationsState
    extends State<NavigationRailDestinations> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final gap = (height >= 750 ? 60 : (height * .05)).height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              widget.onTap(0);
            },
            child: SvgPicture.asset(
              'assets/images/index1.svg',
              colorFilter: ColorFilter.mode(
                  widget.currentIndex == 0
                      ? AppColors.greenShade
                      : AppColors.white,
                  BlendMode.srcIn),
            ),
          ),
          gap,
          InkWell(
            onTap: () {
              widget.onTap(1);
            },
            child: SvgPicture.asset(
              'assets/images/index2.svg',
              colorFilter: ColorFilter.mode(
                  widget.currentIndex == 1
                      ? AppColors.greenShade
                      : AppColors.white,
                  BlendMode.srcIn),
            ),
          ),
          gap,
          InkWell(
            onTap: () {
              widget.onTap(2);
            },
            child: SvgPicture.asset(
              'assets/images/index3.svg',
              colorFilter: ColorFilter.mode(
                  widget.currentIndex == 2
                      ? AppColors.greenShade
                      : AppColors.white,
                  BlendMode.srcIn),
            ),
          ),
          gap,
          InkWell(
            splashColor: AppColors.orange,
            onTap: () {
              widget.onTap(3);
            },
            child: SvgPicture.asset(
              'assets/images/index4.svg',
              colorFilter: ColorFilter.mode(
                  widget.currentIndex == 3
                      ? AppColors.greenShade
                      : AppColors.white,
                  BlendMode.srcIn),
            ),
          ),
          gap,
          InkWell(
            onTap: () {
              widget.onTap(4);
            },
            child: SvgPicture.asset(
              'assets/images/index5.svg',
              colorFilter: ColorFilter.mode(
                  widget.currentIndex == 4
                      ? AppColors.greenShade
                      : AppColors.white,
                  BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
