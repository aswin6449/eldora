import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Providers/calculations.dart';
import 'Health/bottom.dart';

class NamePage extends StatefulWidget {
  String phone="";
  NamePage(this.phone, {Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  var name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 270, 80, 30),

              child: TextFormField(
                onChanged: (value){
                  name = value;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Provider.of<Calculations>(context, listen: false).addtoUserData(context, {
                    'name':name,
                    'number': widget.phone,
                  });
                  Navigator.pushReplacement(context, PageTransition(
                      child: BottomNavbar(),
                      type: PageTransitionType.leftToRight)
                  );
                },
                child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
