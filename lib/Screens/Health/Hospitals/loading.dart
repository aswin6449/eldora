import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../bottom.dart';
import '../health.dart';
import 'hospitals.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState()
  {
    Timer(const Duration(seconds: 5),
            ()=> Navigator.pushReplacement(context, PageTransition(
            child: const HospitalsScreen(),
            type: PageTransitionType.leftToRightWithFade
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF200B4B),
        title: const Text('Eldora',
          style: TextStyle(
            // fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 24.0,
              letterSpacing: 3
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: (){
            Navigator.pushReplacement(context, PageTransition(
                child: BottomNavbar(),
                type: PageTransitionType.leftToRightWithFade
            )
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 300,
            child: Lottie.asset('assets/animations/location2.json'),
          ),
          const Center(
            child: Text('Searching Hospitals ...',
         style: TextStyle(
             color: Colors.black
         ),
            ),
          )
        ],
      ),
    );
  }
}
