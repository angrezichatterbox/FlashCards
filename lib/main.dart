import 'package:flash_cards/pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(goToPage: const HomePage(), duration: 5),
    ),
  );
}

class SplashPage extends StatelessWidget {
  final int duration;
  final Widget goToPage;

  SplashPage({
    required this.goToPage,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: duration),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => goToPage,
          ),
        );
      },
    );
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Icon(Icons.lightbulb_outline, color: Colors.white, size: 200),
      ),
    );
  }
}

