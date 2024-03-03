import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isIcon;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.title,
    this.isIcon = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 46.0,
        decoration: BoxDecoration(
          color: CustomColors.PRIMARY,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: isIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(""),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.BACKGROUND,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Image.asset(
                    'assets/icons/Arrow_Right_White.png',
                    width: 24.0,
                    height: 24.0,
                  )
                ],
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: CustomColors.BACKGROUND,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
      ),
    );
  }
}
