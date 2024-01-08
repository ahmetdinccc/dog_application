import 'package:flutter/material.dart';
import 'package:dog_application/Pages/home.dart';
import 'package:dog_application/Pages/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [const Home(), const Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 91,
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 243, 243, 242),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
