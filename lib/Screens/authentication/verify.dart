import 'package:eldora/Screens/authentication/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../Health/bottom.dart';
import '../name.dart';

class MyVerify extends StatefulWidget {
  String phone = "";
  MyVerify(this.phone, {Key? key}) : super(key: key);
  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  Duration myDuration = Duration(days: 5);
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final seconds = myDuration.inSeconds.remainder(60);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: const MobileSignIn(),
                    type: PageTransitionType.rightToLeftWithFade));
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  "Enter the OTP sent to ${widget.phone}",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Proxima',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        // Create a PhoneAuthCredential with the code
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: MobileSignIn.verify,
                            smsCode: code);
                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        // Provider.of<Calculations>(context, listen: false).addtoUserData(context, {
                        //   'number': widget.phone,
                        // });
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child:  NamePage(widget.phone),
                                type: PageTransitionType.leftToRight));
                      } catch (e) {
                        print("Wrong OTP");
                      }
                    },
                    child: Text("Verify OTP",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ))),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Countdown(
                    seconds: 30,
                    build: (BuildContext context, double time) =>
                        Text("Didn't receive it? Retry in ${time.toString().substring(0,2)}",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Proxima'
                          ),
                        ),
                    interval: Duration(milliseconds: 100),
                    onFinished: () {
                      print('Timer is done!');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
