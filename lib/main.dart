import 'package:flutter/material.dart';

import 'screens/length.dart';
import 'screens/temperature.dart';
import 'screens/volume.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  int _pageIndex = 0;

  late PageController _pageController;

  List<Widget> tabPages = [
    Length(),
    Temperature(),
    Volume(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quantity Converter"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 50,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/Images/scale.png')),
              label: "Length"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/Images/hotColor.png')),
              label: "Temperature"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/Images/volume.png')),
              label: "Volume"),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
