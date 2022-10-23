import 'dart:async';
import 'package:eldora/Screens/wraps.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'authentication/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()
  {
    Timer(const Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context, PageTransition(
            child: const Wrapper(),
            type: PageTransitionType.leftToRightWithFade
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 400,
            child: Lottie.asset('assets/animations/start.json'),
          ),
        ],
      ),
    );
  }
}
