import 'package:flutter/material.dart';

enum DeviceType { mobile, tab, web }

typedef AppBuilder = Widget Function(
  BuildContext context,
  DeviceType deviceType,
  double width,
);

extension DeviceTypeExtension on DeviceType {
  bool get isMobile => this == DeviceType.mobile;

  bool get isTab => this == DeviceType.tab;

  bool get isWeb => this == DeviceType.web;

  bool get isWebTab => isTab || isWeb;
  bool get isMobileTab => isTab || isMobile;
}

class AppLayoutBuilder extends StatefulWidget {
  const AppLayoutBuilder(
    this.builder, {
    super.key,
  });

  final AppBuilder builder;

  @override
  State<AppLayoutBuilder> createState() => _AppLayoutBuilderState();
}

class _AppLayoutBuilderState extends State<AppLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        late DeviceType type;

        if (constraints.maxWidth < 480) {
          type = DeviceType.mobile;
        } else if (constraints.maxWidth >= 480 && constraints.maxWidth <= 720) {
          type = DeviceType.tab;
        } else if (constraints.maxWidth > 720) {
          type = DeviceType.web;
        }
        return widget.builder(context, type, constraints.maxWidth);
      },
    );
  }
}

// class AppLayoutBuilderWeb extends StatefulWidget {
//   const AppLayoutBuilderWeb(
//     this.builder, {
//     super.key,
//   });
//
//   final AppBuilder builder;
//
//   @override
//   State<AppLayoutBuilderWeb> createState() => _AppLayoutBuilderWebState();
// }
//
// class _AppLayoutBuilderWebState extends State<AppLayoutBuilderWeb> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         late DeviceType type;
//
//         if (constraints.maxWidth <= 480) {
//           type = DeviceType.mobile;
//         } else if (constraints.maxWidth > 480 && constraints.maxWidth <= 830) {
//           type = DeviceType.tab;
//         } else if (constraints.maxWidth > 830) {
//           type = DeviceType.web;
//         }
//         return widget.builder(context, type, constraints.maxWidth);
//       },
//     );
//   }
// }
