import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class CutomAppBar extends StatelessWidget {
  final String appBarTitle;
  const CutomAppBar({
    super.key,
    this.appBarTitle = "Add Task",
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
          "assets/icons/Arrow_Left_Black.png",
          width: 24.0,
          height: 24.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        appBarTitle,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: CustomColors.SURFACED,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}
