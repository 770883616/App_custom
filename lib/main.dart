import 'package:explore_pc/auth/sign_in.dart';
import 'package:explore_pc/components/bottomNigation_home.dart';
import 'package:explore_pc/components/myscaffold.dart';
import 'package:explore_pc/components/splashscreen.dart';
import 'package:explore_pc/models/cart.dart';
import 'package:explore_pc/models/mycolors.dart';
import 'package:explore_pc/onboardingscreens/fristpage.dart';
import 'package:explore_pc/onboardingscreens/onepage.dart';
import 'package:explore_pc/widgets/mycirclstart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: GetMaterialApp(
        locale: Locale('en'),
        // routes: {
        //   '/': (context) => splashScreen(),
        //   '/FirstPage': (context) => FirstPage(),
        // },
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
        //  FirstPage(),
      ),
    );
  }
}
