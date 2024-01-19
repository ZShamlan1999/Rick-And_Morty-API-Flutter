import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class BuildDividerWidget extends StatelessWidget {
  const BuildDividerWidget({super.key, required this.endIndent});

  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: ColorsManger.yellow,
      thickness: 2,
    );
  }
}