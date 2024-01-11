import 'package:flutter/material.dart';
import 'TopicsPage.dart';

void main() {
  runApp(MaterialApp(
    home: ExplorePage(),
  ));
}

class ExplorePage extends StatelessWidget {
  final List<Map<String, String?>> images = [
    {
      'url':
          'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Mathematics',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1628595351029-c2bf17511435?q=80&w=3432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Chemistry',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1416816901131-9e5eab64c1c1?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Biology',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1644325349124-d1756b79dd42?q=80&w=3550&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Physics',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1699891730669-2d15cf3a5979?q=80&w=3432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Geometry',
    },
    {
      'url':
          'https://images.unsplash.com/photo-1645395759348-a0dd7ccf1602?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'text': 'Electronics',
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
      body: ListView(
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
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
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
    );
  }

  void _navigateToPlaceholder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TopicPage()),
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
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25),
                  BlendMode.srcOver,
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                ),
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
