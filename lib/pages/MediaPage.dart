import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState(){
    print('initializing page');
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Tab>[
              Tab(text: 'Audio',),
              Tab(text: 'Video',),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
              child: Text('Audio data'),
            ),
            GridView.count(
              crossAxisCount: Config.gridCount,
              children: List.generate(20, (index) {
                return Container(
                  width: Config.iconMediumSize,
                  height: Config.iconMediumSize,
                  decoration: BoxDecoration(
                    color: Color(Config.colorBlack),
                    border: Border.all(color: Color(Config.colorLightGrey))
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
