import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/src/components/utils/extensions.dart';

import '../../../base/nav/app_nav.dart';
import '../../../base/nav/app_pages.dart';
import '../../constants/colors.dart';
import '../../widgets/app_layout_builder.dart';
import '../drawer_view.dart';
import 'bottom_nav_bar.dart';
import 'navigation_rail_web.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    super.key,
    required this.child,
    required this.path,
  });

  final Widget child;
  final String path;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    _syncIndex();
  }

  @override
  void didUpdateWidget(covariant NavigationPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncIndex();
  }

  void _syncIndex() {
    for (var i = 0; i < AppPages.bottomNavPages.length; i++) {
      if (AppPages.bottomNavPages[i].path == widget.path) {
        _currentIndex = i;
        setState(() {});

        break;
      }
    }
  }

  void onTap(int value) {
    _currentIndex = value;
    setState(() {});
    AppNavigation.goNamed(AppPages.bottomNavPages[value]);
  }

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder(
      (context, deviceType, width) {
        if (deviceType.isWeb) {
          return Scaffold(
            endDrawer: DrawerPage(
              closeDrawer: () {
                _key.currentState!.closeEndDrawer();
              },
            ),
            key: _key,
            backgroundColor: AppColors.black,
            drawer: DrawerPage(
              closeDrawer: () {
                _key.currentState!.closeDrawer();
              },
            ),
            body: NavigationRailWeb(
              currentIndex: _currentIndex,
              onTap: onTap,
              path: widget.path,
              openDrawer: () {
                _key.currentState!.openDrawer();
              },
              openEndDrawer: () {
                _key.currentState!.openEndDrawer();
              },
              child: widget.child,
            ),
          );
        } else if (deviceType.isMobileTab || deviceType.isTab) {
          return PopScope(
            // canPop: true,
            canPop: _currentIndex == 0,
            onPopInvoked: (bool didPop) {
              if (didPop) {
                return;
              }
              AppNavigation.goNamed(AppPages.homePage);
            },
            // onWillPop: () async {
            //   if (_currentIndex == 0) {
            //     SystemNavigator.pop();
            //     return true;
            //   } else {
            //     AppNavigation.goNamed(AppPages.homePage);
            //   }
            //   return false;
            // },
            child: Scaffold(
              key: _key,
              backgroundColor: AppColors.black,
              drawer: DrawerPage(
                closeDrawer: () {
                  _key.currentState!.closeDrawer();
                },
              ),
              appBar: AppPages.isHomePage(widget.path)
                  ? AppBar(
                      centerTitle: true,
                      leading: _currentIndex == 0
                          ? InkWell(
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                              child: SvgPicture.asset(
                                'assets/images/menu.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          : const SizedBox(),
                      title: _currentIndex == 0
                          ? null
                          : TitleWidget(index: _currentIndex),
                      actions: [
                        // if (_currentIndex == 0) ...[
                        //   UserProfileWidget(isWeb: false),
                        //   // 20.width,
                        // ],
                      ],
                    )
                  : null,
              body: widget.child,
              bottomNavigationBar: AppPages.isHomePage(widget.path)
                  ? BottomNavBarPhone(
                      currentIndex: _currentIndex,
                      onTap: onTap,
                    )
                  : null,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    var title = '';
    if (index == 1) {
      title = 'Journals';
    } else if (index == 2) {
      title = 'Assessments';
    } else if (index == 3) {
      title = 'Library';
    } else if (index == 4) {
      title = 'Contact Us';
    } else {
      title = '';
    }
    return Padding(
      padding: const EdgeInsets.only(left: kIsWeb ? 30 : 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/index${index + 1}.svg'),
          10.width,
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
