import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class InProgressItemContainer extends StatelessWidget {
  final String category;
  final String taskName;
  final double prasentage;
  final Color bgColor;
  const InProgressItemContainer({
    super.key,
    required this.category,
    required this.taskName,
    required this.prasentage,
    this.bgColor = CustomColors.PRIMARY,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 180.0,
      padding: const EdgeInsets.all(
        20.0,
      ),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: CustomColors.SECONDARY,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Image.asset(
                'assets/icons/work.png',
                fit: BoxFit.cover,
                width: 30.0,
                height: 30.0,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            taskName,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: CustomColors.SURFACED,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          LinearProgressIndicator(
            minHeight: 8.0,
            borderRadius: BorderRadius.circular(10.0),
            value: prasentage,
            valueColor: AlwaysStoppedAnimation<Color>(bgColor),
            backgroundColor: CustomColors.BACKGROUND,
          ),
        ],
      ),
    );
  }
}
