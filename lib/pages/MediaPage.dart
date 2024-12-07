import 'dart:convert';
import 'dart:isolate';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ziklagyouth/config/dictionary.dart';
import 'package:ziklagyouth/pages/Players/AppVideoPlayer.dart';
import '../config/config.dart';

Future<void> getMediaIsolate(SendPort sendPort) async {
  var decoded;
  await http.get(
      Uri.parse(Config.mediaLink)
  ).then((response) => {
    if ( response.body.isNotEmpty ) {
      decoded = jsonDecode(response.body),
      sendPort.send(decoded["getMediaUpload"])
    }
  }).catchError((error) => {});
}

Future<dynamic> getMedia() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(getMediaIsolate, receivePort.sendPort);
  final result = await receivePort.first;
  receivePort.close();
  return result;
}

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState(){
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

    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: const <Tab>[
                Tab(text: Dictionary.audio,),
                Tab(text: Dictionary.video,),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              audioContent(),
              videoContent(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<dynamic> audioContent() {
    return FutureBuilder<dynamic>(
      future: getMedia(),
      builder: (context, snapshot) {
        if ( snapshot.hasError ) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if ( snapshot.hasData ) {
          return GridView.count(
            crossAxisCount: Config.gridCount,
            children: List.generate(snapshot.data.length, (index) {
              return ( snapshot.data[index]["type"].contains("audio") )
                  ? Container(
                width: Config.iconMediumSize,
                height: Config.iconMediumSize,
                decoration: BoxDecoration(
                    color: const Color(Config.colorBlack),
                    border: Border.all(color: const Color(Config.colorLightGrey))
                ),
              )
                  : Container();
            }),
          );
        } else {
          return Center(
            child: Text("No data available"),
          );
        }
      },
    );
  }
  FutureBuilder<dynamic> videoContent() {
    return FutureBuilder<dynamic>(
      future: getMedia(),
      builder: (context, snapshot) {
        if ( snapshot.hasError ) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if ( snapshot.hasData ) {
          return GridView.count(
            crossAxisCount: Config.gridCount,
            children: List.generate(snapshot.data.length, (index) {
              return ( snapshot.data[index]["type"].contains("video") )
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (content) => AppVideoPlayer(
                              videoData: snapshot.data,
                              initialIndex: index
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: Config.iconMediumSize,
                      height: Config.iconMediumSize,
                      decoration: BoxDecoration(
                          color: const Color(Config.colorBlack),
                          border: Border.all(color: const Color(Config.colorLightGrey))
                      ),
                      child: Text(
                        snapshot.data[index]["title"],
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(Config.colorDarkGrey),
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  )
                  : Container();
            }),
          );
        } else {
          return const Center(
            child: Text("No data available"),
          );
        }
      },
    );
  }
}
