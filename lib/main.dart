import 'package:eldora/Screens/Splash_screen.dart';
import 'package:eldora/services/managedata.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Providers/auth.dart';
import 'Providers/calculations.dart';
import 'Screens/Health/reminder/notifi_handler.dart';
import 'models/user.dart';

// Main function of the project
void main() async {
  // to make sure that you have an instance of the WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();
  // To initialize firebase
  await Firebase.initializeApp();
  await NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Providers are used to pass the data down to the widget tree
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Calculations()),
      ],
      // Stream has a list of event
      // Future has only one event
      child: StreamProvider<Userr?>.value(
        initialData: null,
        value: AuthService().user,
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
