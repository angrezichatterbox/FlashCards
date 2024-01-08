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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Colors.black,
        child: Stack(
         children: [Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Icon(Icons.lightbulb_outline,color: Colors.white,size: 200,),
              Text('FlashMinds',style: TextStyle(color: Colors.white,fontSize: 34,fontWeight: FontWeight.bold)),
              Text('Get the balance right',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w100)),
              SizedBox(width:5,height: 5,),
              Text(' "For The Students By The Teachers"',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(width: 25,height: 50,),
             FilledButton(
  style: ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.white),
    backgroundColor: MaterialStateColor.resolveWith((states) =>Color(0xFF25D366))
  ),
  child: const Text(
    '  Continue with Whatsapp   ',
    style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal),
  ),
  onPressed: () {},
),
              SizedBox(width: 25,height: 50,),
              OutlinedButton(onPressed: (){}, child: const Text('Continue with Phone Number',style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.normal)))
            ],
          ),
         )],
        )
      )
    );
  }
}
