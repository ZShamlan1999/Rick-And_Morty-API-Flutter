import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class ShowLoadedIndicator extends StatelessWidget {
  const ShowLoadedIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManger.yellow,
      ),
    );
  }
}
