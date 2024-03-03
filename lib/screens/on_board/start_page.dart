import 'package:flutter/material.dart';
import 'package:todo/themes/custom_colors.dart';

import '../../widgets/custom_button.dart';
import '../bottom_tabbar/custom_tabbart_view.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/let_start_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 60.0),
                child: Column(
                  children: [
                    Text(
                      "Task Management & To-Do List",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: CustomColors.SURFACED,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "This productive tool is designed to help you better manage your task project-wise conveniently!",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: CustomColors.SECONDARY,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                  title: "Get Started",
                  isIcon: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomTabBarVIEW(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
