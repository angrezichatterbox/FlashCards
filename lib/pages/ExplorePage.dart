import 'package:flutter/material.dart';
import 'TopicsPage.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

void main() {
  runApp(MaterialApp(
    home: ExplorePage(),
  ));
}

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  final List<Map<String, String?>> images = [
    {
      'assetPath': 'assets/images/math.jpg',
      'text': 'Mathematics',
    },
    {
      'assetPath': 'assets/images/physics.jpg',
      'text': 'Physics',
    },
    {
      'assetPath': 'assets/images/chemistry.jpg',
      'text': 'Chemistry',
    },
    {
      'assetPath': 'assets/images/biology.jpg',
      'text': 'Biology',
    },
    {
      'assetPath': 'assets/images/geometry.jpg',
      'text': 'Geometry',
    },
    {
      'assetPath': 'assets/images/electronics.jpg',
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text('Nobody Uses the Menu .... Grow Uppp',
                          style: TextStyle(color: Colors.black)),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.black12,
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.black,
        waterDropColor: Colors.white,
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (selectedIndex == 0) {
            _navigateToExplorePage(context);
          } else if (selectedIndex == 1) {
            _navigateToFavoritePage(context);
          }
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.bookmark_rounded,
            outlinedIcon: Icons.bookmark_border_rounded,
          ),
          BarItem(
            filledIcon: Icons.favorite_rounded,
            outlinedIcon: Icons.favorite_border_rounded,
          ),
        ],
      ),
      body: ListView(
        children: [
          for (var imageData in images)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: _buildImageWithBorderAndOpacity(
                imageData['assetPath']!,
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

  void _navigateToExplorePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExplorePage()),
    );
  }

  void _navigateToFavoritePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConstitutionPage()),
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
                child: Image.asset(
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

class ConstitutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Construction'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.build,
              size: 100,
              color: Colors.orange,
            ),
            SizedBox(height: 16),
            Text(
              'This page is under construction.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Check back soon for updates!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}