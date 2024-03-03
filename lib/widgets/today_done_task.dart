import 'package:flutter/material.dart';

import '../themes/custom_colors.dart';
import 'rounded_progress_indicator.dart';

class TodaysDonTaskContainer extends StatelessWidget {
  const TodaysDonTaskContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(
        26.0,
      ),
      decoration: BoxDecoration(
        color: CustomColors.PRIMARY,
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your today's task almost done!",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: CustomColors.BACKGROUND,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: CustomColors.BACKGROUND,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    "View Task",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: CustomColors.PRIMARY,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
            ],
          ),
          const RoundedProgressIndicator(
            value: 0.7,
            bgColor: CustomColors.BACKGROUND,
            prasentageTextColor: CustomColors.BACKGROUND,
          )
        ],
      ),
    );
  }
}
