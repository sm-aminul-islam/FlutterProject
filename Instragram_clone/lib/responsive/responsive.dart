import 'package:flutter/material.dart';
import 'package:instragram_flutter/utils/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;
  const ResponsiveLayout(
      {super.key,
      required this.mobileScreenlayout,
      required this.webScreenlayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return webScreenlayout;
      } else {
        return mobileScreenlayout;
      }
    });
  }
}
