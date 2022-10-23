import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Health/bottom.dart';
import '../Health/health.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF200B4B),
        onPressed: (){
        },
        child: Icon(Icons.add),
      ),
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
      body: SingleChildScrollView(
        child: Container(

          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Padding(
            padding: const EdgeInsets.only(top:20.0,left: 15),
            child: RichText(
              text: const TextSpan(
                  text: 'My',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25.0,
              ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Diary',
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
                            SizedBox(
                              height: 90,
                              child: Image(image: AssetImage('assets/paint.png'),),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(0, 20, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Good Day!!',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'I painted a beautiful portrait today',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          '23.10.22    |    10:53 am',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
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
      ),

    );
  }
}

