import 'package:eldora/Screens/Health/todo/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../Providers/auth.dart';
import '../Diary/diary.dart';
import '../authentication/sign_in.dart';
import 'Hospitals/loading.dart';
import 'alert/alert.dart';

class HealthSection extends StatefulWidget {
  const HealthSection({Key? key}) : super(key: key);

  @override
  State<HealthSection> createState() => _HealthSectionState();
}

class _HealthSectionState extends State<HealthSection> {
  final AuthService _auth = AuthService();

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
          onPressed: () {
            _auth.signOut();
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: const MobileSignIn(),
                    type: PageTransitionType.leftToRight));
          },
          icon: const Icon(Icons.logout),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.45, 0.6, 0.9],
                colors: [
                  Color(0xFF200B4B),
                  Color(0xFF201F22),
                  Color(0xFF1A1031),
                  Color(0xFF19181F),
                ],
              )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 0, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 250,
                      ),
                      child: RichText(
                        text: const TextSpan(
                            text: 'Good evening,',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 35.0,
                              letterSpacing: 2
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '\nAswin B',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      // fontWeight: FontWeight.w600,
                                      color: Colors.white))
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 15, 0, 6),
                      child: RichText(
                        text: const TextSpan(
                            text: 'Personal',
                            style: TextStyle(
                              shadows: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 0)
                              ],
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Care',
                                  style: TextStyle(
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 0)
                                      ],
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey))
                            ]),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 200.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, PageTransition(
                                  child: TodoListScreen(),
                              type: PageTransitionType.leftToRightWithFade
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 155,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(40)),
                                    color: Colors.white.withOpacity(0.8),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.lightBlueAccent,
                                          blurRadius: 2,
                                          spreadRadius: 2)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 16,top: 6),
                                            child: SizedBox(
                                              height: 120,
                                              child: Icon(Icons.notifications_active_outlined,
                                                size: 100,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 5.0,left: 17),
                                        child: Text(
                                          'Reminders',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 200.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const DiaryPage(),
                                      type: PageTransitionType.leftToRight));
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 155,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(40)),
                                    color: Colors.white.withOpacity(0.8),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.lightBlueAccent,
                                          blurRadius: 2,
                                          spreadRadius: 2)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children:  [
                                          Center(
                                            child: SizedBox(
                                              height: 109,
                                               child: Icon(Icons.edit_note_sharp,
                                               size: 100,
                                               )
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 8.0,right: 15,left: 25,bottom: 10),
                                        child: Text(
                                          'Personal Diaries',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 15,left: 11),
                      child: RichText(
                        text: const TextSpan(
                            text: 'Emergency',
                            style: TextStyle(
                              shadows: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 0)
                              ],
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Section',
                                  style: TextStyle(
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 0)
                                      ],
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey))
                            ]),
                      ),
                    ),

                    // MiddleHelpers().dataBusiness(context, 'business')
                    Container(
                      height: 140,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child:  MyAlertScreen(),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: Colors.white.withOpacity(0.8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent,
                                      blurRadius: 2,
                                      spreadRadius: 3)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 90,
                                  child: Icon(Icons.crisis_alert,
                                    size: 55,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 43, 0, 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Alert nearby people',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 140,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const LocationScreen(),
                                  type: PageTransitionType.leftToRight));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: Colors.white.withOpacity(0.8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.redAccent,
                                      blurRadius: 2,
                                      spreadRadius: 3)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: SizedBox(
                                    height: 90,
                                    child: Icon(Icons.location_on,
                                      size: 55,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 44, 0, 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Finding nearby Hospitals',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}
