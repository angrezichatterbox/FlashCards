import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

void main() {
  runApp(MyFlipCard());
}

class MyFlipCard extends StatefulWidget {
  const MyFlipCard({Key? key}) : super(key: key);

  @override
  State<MyFlipCard> createState() => _MyFlipCardState();
}

class _MyFlipCardState extends State<MyFlipCard> {
  final List<Map<String, String>> formulas = [
    {"title": "Pythagorean Theorem", "formula": "a² + b² = c²"},
    {"title": "Quadratic Formula", "formula": "x = (-b ± √(b² - 4ac)) / 2a"},
    {"title": "Area of a Circle", "formula": "A = πr²"},
    {"title": "Volume of a Cylinder", "formula": "V = πr²h"},
    {"title": "Euler's Identity", "formula": "e^(iπ) + 1 = 0"},
    
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          toolbarHeight: 75,
          leadingWidth: 15,
          title: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.lightbulb_outlined, size: 40, color: Colors.white),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'The Menu is Still in Works. Explore The other aspects',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
        body: Column(
          children: [
            TimerCountdown(
              endTime: DateTime.now().add(
                const Duration(
                  minutes: 00,
                  seconds: 15,
                ),
              ),
              onEnd: () {
                print("Timer finished");
              },
            ),
            Text(
              'Hello World',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 400.0,
              child: PageView.builder(
                itemCount: formulas.length,
                itemBuilder: (context, index) {
                  return FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      alignment: Alignment.center,
                      width: 320,
                      height: 320,
                      color: Colors.white,
                      child: Text(formulas[index]["title"]!),
                    ),
                    back: Container(
                      alignment: Alignment.center,
                      width: 320,
                      height: 320,
                      color: Colors.teal,
                      child: Text(formulas[index]["formula"]!),
                    ),
                    autoFlipDuration: const Duration(seconds: 15),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
