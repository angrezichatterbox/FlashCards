import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  // List of image URLs and corresponding text
  final List<Map<String, String?>> images = [
    {
      'url':
          'https://images.unsplash.com/photo-1491895200222-0fc4a4c35e18?q=80&w=3474&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': '',
    },
    {
      'url':
          'https://img.freepik.com/free-vector/mathematical-geometric-background-vector-gradient-blue-education-remix_53876-114100.jpg?w=2000&t=st=1704792932~exp=1704793532~hmac=38fe31689952f9d1f8b7a23c88c1e5026e06e37cca2f1c2a1598b259e1e24150',
      'text': '',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHNjaWVuY2UlMjBhbmQlMjB0ZWNobm9sb2d5fGVufDB8fDB8fHww',
      'text': 'Computer Science',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Add your onPressed logic here
            },
          )
        ],
      ),
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Column(
            children: [
              for (var imageData in images)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: _buildImageWithBorderAndOpacity(
                    imageData['url']!,
                    text: imageData['text']?.isNotEmpty ?? false
                        ? Text(
                            imageData['text']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        : null,
                    onTap: () {
                      _navigateToPlaceholder(context);
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToPlaceholder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PlaceholderScreen()),
    );
  }

  Widget _buildImageWithBorderAndOpacity(
    String imageUrl, {
    Text? text,
    VoidCallback? onTap,
  }) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
            ),
          ),
        ),
        if (text != null)
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: text,
            ),
          ),
      ],
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder Screen'),
      ),
      body: Center(
        child: Text('This is a placeholder screen.'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExplorePage(),
  ));
}
