import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class RoundedProgressIndicator extends StatelessWidget {
  final double value;
  final Color bgColor;
  final Color prasentageTextColor;

  const RoundedProgressIndicator({
    required this.value,
    this.bgColor = CustomColors.PRIMARY,
    this.prasentageTextColor = CustomColors.SURFACED,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 5.0,
            backgroundColor: bgColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(bgColor),
          ),
        ),
        Text(
          '${(value * 100).toInt()}%',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: prasentageTextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
