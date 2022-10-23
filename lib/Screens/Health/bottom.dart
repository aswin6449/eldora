import 'package:flutter/material.dart';
import '../Konnect/konnect.dart';
import '../Reader/reader.dart';
import '../Stereo/speech_to_text.dart';
import '../Stereo/stereo.dart';
import 'health.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HealthSection(),
    ReaderPage(),
    Speechtotext(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.health_and_safety),
                label: 'Health',
                backgroundColor:  Color(0xFF200B4B),
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.chrome_reader_mode),
                label: 'Reader',
                backgroundColor:  Color(0xFF200B4B),
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.earbuds),
                label: 'Stereo',
                backgroundColor: Color(0xFF200B4B),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}
