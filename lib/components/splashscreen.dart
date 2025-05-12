import 'dart:async';

import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/onboardingscreens/fristpage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: Image.asset("images/Explore PC.gif"),
          )
        ],
      ),
      nextScreen: Myscaffold(
        mywidget: FirstPage(),
      ),
      splashIconSize: 400,
      backgroundColor: Mycolors().myColorbackgrond,
    );
  }
}
