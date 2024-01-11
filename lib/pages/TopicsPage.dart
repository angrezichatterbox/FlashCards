import 'package:flash_cards/pages/FlipCard.dart';
import 'package:flutter/material.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Displaying a simple dialog with your text
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          'The Menu is Still in Works Explore The other aspects',
                          style: TextStyle(color: Colors.black)),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              // Your onTap action
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFlipCard()));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.functions,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Your onTap action
              print('Container tapped!');
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.functions,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Your onTap action
              print('Container tapped!');
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.functions,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Your onTap action
              print('Container tapped!');
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.functions,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Your onTap action
              print('Container tapped!');
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.functions,
                    size: 100,
                  ),
                ),
              ),
            ),
          ),

          // Add more Padding and Container widgets as needed
        ],
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.functions,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'This is a placeholder screen.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
