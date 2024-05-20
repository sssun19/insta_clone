import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body.dart';

void main() {
  runApp(const InstaCloneApp());
}

class InstaCloneApp extends StatelessWidget {
  const InstaCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.white, secondary: Colors.black),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false, // label 안 보이게
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const InstaCloneHome(),
    );
  }
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline, size: 32,),
            onPressed: () {
              print('Tab favorite');
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.paperplane, size: 32,),
            onPressed: () {
              print('Tab paperplane');
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index, //현재 활성화(클릭) 네비게이션바의 인덱스
        onTap: (newIndex) => setState(() => index = newIndex), //클릭할 때마다 활성화 네비게이션바를 바꿔준다
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 28), label: 'Search'),
        ],
      ),
    );
  }
}
