import 'package:flutter/material.dart';
import 'profil.dart';
import 'experience.dart';
import 'education.dart';
import 'skill.dart';
import 'info.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  int _currentScreen = 0;
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfoScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Benoit Requillart")),
      body: _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (onTabTapped),
        currentIndex: _currentScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.apartment_outlined ), label: 'Éxperience'),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: 'Formation'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_outlined), label: 'Compétence'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined ), label: 'Infos +')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}


