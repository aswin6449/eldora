import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:page_transition/page_transition.dart';
import '../bottom.dart';
import '../health.dart';
import 'package:lottie/lottie.dart';


class MyAlertScreen extends StatefulWidget {

  @override
  _MyAlertScreenState createState() => _MyAlertScreenState();
}

class _MyAlertScreenState extends State<MyAlertScreen> {
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC9c50bc6aeae5c9ac4b1e9c4a630d6e65',
        authToken: 'dce5139b6a60df2c5600f69e89c37b5a',
        twilioNumber: '+18588793554');
    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+918056724657', messageBody: 'Hey Aswin B is in Emergency health issue. Check his location at https://goo.gl/maps/tXFM2iEN5B1Djgne7 !!');
  }

  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);

    await twilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Stack(
        children:[
          SizedBox(
            height: 280,
            width: 400,
            child: Lottie.asset('assets/animations/emergency.json'),
          ),
          Padding(
            padding: const EdgeInsets.only(left:160,top:300),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Color(0xFF200B4B);
                    return Colors.red; // Use the component's default.
                  },
                ),
              ), onPressed: () {
                       sendSms;
            }, child: Text('Quick SMS'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:140),
            child: Center(
              child: Text(
                'Press the button to send SMS\n to your Emergency Contact.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15
                ),
              ),
            ),
          ),
        ]

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}