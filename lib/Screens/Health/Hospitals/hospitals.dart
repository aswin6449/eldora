import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../bottom.dart';
import '../health.dart';


class HospitalsScreen extends StatefulWidget {
  const HospitalsScreen({Key? key}) : super(key: key);

  @override
  State<HospitalsScreen> createState() => _HospitalsScreenState();
}

class _HospitalsScreenState extends State<HospitalsScreen> {
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
      body:SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20.0,left: 15),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                          text: 'Hospitals',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' near me',
                                style: TextStyle(
                                    fontSize:25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                )
                            )
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightBlueAccent,
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Nivetha Hospital',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Ratings: 4.3 | Open 24 hours',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Hospital - Dharapuram , Tamil Nadu',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),


                                ],
                              ),

                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 75,
                                  child: Icon(Icons.directions,
                                    size: 50,
                                  ),
                                ),
                                Text('1.7 kms',style: TextStyle(
                                    color: Colors.blueAccent
                                ),),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //////////////////
                Container(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightBlueAccent,
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Sri Sai Hospital',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Ratings: 4.1 | Open 24 hours',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Hospital - Dharapuram , Tamil Nadu',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),


                                ],
                              ),

                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 75,
                                  child: Icon(Icons.directions,
                                    size: 50,
                                  ),
                                ),
                                Text('2.1 kms',style: TextStyle(
                                  color: Colors.blueAccent
                                ),),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ////////////////////////////
                Container(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightBlueAccent,
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Sujith Nursing Home',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Ratings: 3.3 | Open 24 hours',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Hospital - Dharapuram , Tamil Nadu',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),


                                ],
                              ),

                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 75,
                                  child: Icon(Icons.directions,
                                    size: 50,
                                  ),
                                ),
                                Text('4.3 kms',style: TextStyle(
                                    color: Colors.blueAccent
                                ),),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ////////////////////////////////////////
                Container(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white.withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightBlueAccent,
                                  blurRadius: 2,
                                  spreadRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Ashika Hospital',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'No reviews | Open 24 hours',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Hospital - Dharapuram , Tamil Nadu',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),


                                ],
                              ),

                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 75,
                                  child: Icon(Icons.directions,
                                    size: 50,
                                  ),
                                ),
                                Text('10 kms',style: TextStyle(
                                    color: Colors.blueAccent
                                ),),
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
