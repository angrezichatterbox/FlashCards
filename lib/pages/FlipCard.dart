import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_tex/flutter_tex.dart';
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
    {"title": "Probability of A or B", "formula": "P(A ∪ B) = P(A) + P(B) - P(A ∩ B)"},
  {"title": "Complement Rule", "formula": "P(A') = 1 - P(A)"},
  {"title": "Law of Total Probability", "formula": "P(B) = Σ P(B|Aᵢ) * P(Aᵢ)"},
  {"title": "Expected Value", "formula": "E(X) = Σ x * P(X = x)"},
  {"title": "Variance", "formula": "Var(X) = E((X - μ)²)"},
  {"title": "Standard Deviation", "formula": "σ = √Var(X)"},
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
          leadingWidth: 60,
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  color: Colors.black,
                  child: PageView.builder(
                    itemCount: formulas.length + 1,
                    itemBuilder: (context, index) {
                      if (index == formulas.length) {
                    
                        return Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              
                              _showAddCardDialog();
                            },
                            child: Text('Add Flip Card'),
                          ),
                        );
                      } else {
                
                        return FlipCard(
                          direction: FlipDirection.HORIZONTAL,
                          front: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formulas[index]["title"]!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          back: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TeXView(
  child: TeXViewColumn(
    children: [
      TeXViewDocument(
        formulas[index]["formula"]!,
        style: TeXViewStyle(
          textAlign: TeXViewTextAlign.center,
          margin: TeXViewMargin.all(10),
        ),
      ),
    ],
  ),
),
 
                                Text(
                                  'Formula:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          autoFlipDuration: const Duration(seconds: 15),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddCardDialog() {
    String title = "";
    String formula = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Flip Card'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Formula'),
                onChanged: (value) {
                  formula = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
          
                addFlipCard(title, formula);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void addFlipCard(String title, String formula) {
 
    setState(() {
      formulas.add({"title": title, "formula": formula});
    });
  }
}
