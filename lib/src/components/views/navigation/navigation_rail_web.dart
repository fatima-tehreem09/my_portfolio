import 'package:flutter/material.dart';
import 'package:my_portfolio/src/components/utils/extensions.dart';

import '../../constants/colors.dart';
import 'navigation_rail_destinations.dart';

class NavigationRailWeb extends StatefulWidget {
  final Widget? child;
  final int currentIndex;
  final Function(int) onTap;
  final String path;
  final VoidCallback openDrawer;
  final VoidCallback openEndDrawer;

  const NavigationRailWeb({
    super.key,
    this.child,
    required this.currentIndex,
    required this.path,
    required this.onTap,
    required this.openDrawer,
    required this.openEndDrawer,
  });

  @override
  State<NavigationRailWeb> createState() => _NavigationRailWebState();
}

class _NavigationRailWebState extends State<NavigationRailWeb> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        // if (AppPages.isHomePage(widget.path))
        Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 50, 0, 20),
                padding: const EdgeInsets.fromLTRB(12, 30, 12, 0),
                // width: 95,
                // height: 780,
                decoration: BoxDecoration(
                  color: const Color(0xff171718),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: const Color(0xff252525),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: widget.openDrawer,
                      child: Container(
                        width: 71,
                        height: 71,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.grey,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(71),
                          // child: NetworkImageWidget(
                          //     imageString:
                          //         (ProfileService.instance.user.image ?? '')
                          //             .fileUrl),
                        ),
                      ),
                    ),
                    60.height,
                    Expanded(
                      child: NavigationRailDestinations(
                        currentIndex: widget.currentIndex,
                        onTap: widget.onTap,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0, top: height * .06),
              child: Image.asset(
                'assets/images/logo.png',
                width: 80,
                height: 36,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),

        Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              // if (AppPages.isHomePage(widget.path))
              //   AppBarWeb(
              //     currentIndex: widget.currentIndex,
              //     openEndDrawer: widget.openEndDrawer,
              //   ),
              Expanded(child: widget.child ?? SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
