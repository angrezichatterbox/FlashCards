// ignore: file_names
import 'package:flash_cards/pages/ExplorePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.lightbulb_outline, color: Colors.white, size: 150),
              const SizedBox(height: 20),
              const Text('FlashMinds', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
              const Text('Get the balance right', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300)),
              const SizedBox(height: 10),
              const Text(' "For The Students By The Teachers"', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xFF25D366)),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16, horizontal: 32)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Continue with Whatsapp',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16, horizontal: 32)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ExplorePage()));
                },
                child: const Text(
                  'Continue with Phone Number',
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
