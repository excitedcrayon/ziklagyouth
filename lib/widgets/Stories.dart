import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {

  late List<String> stories;
  late PageController _pageController;
  late ScrollController _scrollController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    stories = [
      'https://jrm.org.zw/wp-content/uploads/2017/01/Global-Youth-Conference.png',
      'https://jrm.org.zw/wp-content/uploads/2017/01/Couples-Fellowship-2024.png',
      'https://jrm.org.zw/wp-content/uploads/2024/06/PRAYER-RETREAT-2024-THUMBNAIL.png',
      'https://jrm.org.zw/wp-content/uploads/2024/06/Ladies-Fellowship-2024.png',
      'https://jrm.org.zw/wp-content/uploads/2017/01/Mens-Fellowship.png',
      'https://jrm.org.zw/wp-content/uploads/2024/06/Revelation-Gathering-2of2024-Final.png'
    ];

    _pageController = PageController();
    _scrollController = ScrollController();

    // Start auto advancing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //_startAutoAdvance();
    });
  }

  @override void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: stories.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        stories[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
