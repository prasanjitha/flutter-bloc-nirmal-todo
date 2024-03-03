import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';

class ItemCategory extends StatelessWidget {
  final String title;
  final int count;
  const ItemCategory({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: CustomColors.SURFACED,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Container(
          decoration: BoxDecoration(
              color: CustomColors.SECONDARY.withOpacity(0.1),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: CustomColors.PRIMARY,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
