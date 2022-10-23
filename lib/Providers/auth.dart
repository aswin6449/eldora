import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService
{
  // Instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage='';
  String get getErrorMessage => errorMessage;
  //Pizato => _auth = firebaseAuth

  // Creating user object
  Userr? _userFromFirebaseUser(User? user)
  {
    return user!=null? Userr(uid: user.uid) : null;
  }
  // Auth change listener
  Stream<Userr?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }


  // Sign out
  Future signOut() async
  {
    try
    {
      return await _auth.signOut();
    }
    catch(e)
    {
      switch(e)
      {
        case 'account-exits-with-different-credential':
          errorMessage = 'User not found';
          print(errorMessage);
          break;

        case 'invalid-email':
          errorMessage = 'Sorry! Invalid Email';
          print(errorMessage);
          break;
      }
      print(e.toString());
      return null;
    }
  }
}