import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import 'Health/bottom.dart';
import 'authentication/sign_in.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context);
    if(user==null)
    {
      return MobileSignIn();
      // return Decider();
      // return Authenticate();
    }
    else
    {
      return BottomNavbar();
    }
  }
}

