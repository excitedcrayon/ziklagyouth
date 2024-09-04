import 'package:flutter/material.dart';
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/widgets/CustomWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(Config.defaultPadding),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      CustomWidget.renderText(Config.welcomeText, 0.0,
                          FontWeight.w400, Config.colorBlack),
                      CustomWidget.renderText("Bongani", Config.headingSizeXLarge,
                          FontWeight.w300, Config.colorBlack),
                    ],
                  ),
                ),
                Container(
                  // top level stories section
                  padding: const EdgeInsets.all(Config.defaultPadding / 2),
                  child: SizedBox(
                    width: double.infinity,
                    height: Config.cardHeight,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(Config.defaultPadding / 2),
                          child: Container(
                            width: Config.cardWidth,
                            decoration: BoxDecoration(
                                color: const Color(Config.colorGold),
                                borderRadius:
                                    BorderRadius.circular(Config.defaultPadding / 2)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Config.defaultPadding / 2),
                          child: Container(
                            width: Config.cardWidth,
                            decoration: BoxDecoration(
                                color: const Color(Config.colorGold),
                                borderRadius:
                                    BorderRadius.circular(Config.defaultPadding / 2)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Config.defaultPadding / 2),
                          child: Container(
                            width: Config.cardWidth,
                            decoration: BoxDecoration(
                                color: const Color(Config.colorGold),
                                borderRadius:
                                    BorderRadius.circular(Config.defaultPadding / 2)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Config.defaultPadding / 2),
                          child: Container(
                            width: Config.cardWidth,
                            decoration: BoxDecoration(
                                color: const Color(Config.colorGold),
                                borderRadius:
                                    BorderRadius.circular(Config.defaultPadding / 2)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(Config.defaultPadding / 2),
                          child: Container(
                            width: Config.cardWidth,
                            decoration: BoxDecoration(
                                color: const Color(Config.colorGold),
                                borderRadius:
                                    BorderRadius.circular(Config.defaultPadding / 2)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) ,
                Container(
                  padding: const EdgeInsets.all(Config.defaultPadding),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      CustomWidget.renderText(Config.latestPostsHeading, 0.0,
                          FontWeight.w300, Config.colorBlack),
                      Column(
                        children: <Widget>[
                          Container(
                            height: 150.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: Config.defaultPadding / 2),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://jrm.org.zw/wp-content/uploads/2024/06/PRAYER-RETREAT-2024-THUMBNAIL.png"),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: const Color(Config.colorGold), width: 3.0),
                              borderRadius:
                                  BorderRadius.circular(Config.defaultPadding),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: const Color(Config.colorBlack)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                          Config.defaultPadding)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(Config.defaultPadding),
                                  child: Column(
                                    children: <Widget>[
                                      CustomWidget.renderText(
                                          "Prayer Retreat 2024",
                                          Config.headingSizeXLarge,
                                          FontWeight.w500,
                                          Config.colorWhite),
                                      CustomWidget.renderText(
                                          "3 days absolute fasting from 29 September to 1 August",
                                          Config.headingSizeLarge,
                                          FontWeight.w300,
                                          Config.colorWhite),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 150.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: Config.defaultPadding / 2),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://jrm.org.zw/wp-content/uploads/2024/06/Ladies-Fellowship-2024.png"),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: const Color(Config.colorGold), width: 3.0),
                              borderRadius:
                                  BorderRadius.circular(Config.defaultPadding),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: const Color(Config.colorBlack)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                          Config.defaultPadding)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(Config.defaultPadding),
                                  child: Column(
                                    children: <Widget>[
                                      CustomWidget.renderText(
                                          "Ladies Fellowship 2024",
                                          Config.headingSizeXLarge,
                                          FontWeight.w500,
                                          Config.colorWhite),
                                      CustomWidget.renderText(
                                          "27 - 28 September 2024, Venue TBA",
                                          Config.headingSizeLarge,
                                          FontWeight.w300,
                                          Config.colorWhite),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 150.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: Config.defaultPadding / 2),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://jrm.org.zw/wp-content/uploads/2017/01/Mens-Fellowship.png"),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: const Color(Config.colorGold), width: 3.0),
                              borderRadius:
                                  BorderRadius.circular(Config.defaultPadding),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: const Color(Config.colorBlack)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                          Config.defaultPadding)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(Config.defaultPadding),
                                  child: Column(
                                    children: <Widget>[
                                      CustomWidget.renderText(
                                          "Mens Fellowship 2024",
                                          Config.headingSizeXLarge,
                                          FontWeight.w500,
                                          Config.colorWhite),
                                      CustomWidget.renderText(
                                          "4 - 5 October 2024, Venue TBA. For more informtion contact your Section/Assembly leader for more information",
                                          Config.headingSizeLarge,
                                          FontWeight.w300,
                                          Config.colorWhite),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 150.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: Config.defaultPadding / 2),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://jrm.org.zw/wp-content/uploads/2024/06/Revelation-Gathering-2of2024-Final.png"),
                                  fit: BoxFit.cover),
                              border: Border.all(
                                  color: const Color(Config.colorGold), width: 3.0),
                              borderRadius:
                                  BorderRadius.circular(Config.defaultPadding),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: const Color(Config.colorBlack)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                          Config.defaultPadding)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.all(Config.defaultPadding),
                                  child: Column(
                                    children: <Widget>[
                                      CustomWidget.renderText(
                                          "Revelation Gathering 2 of 2024",
                                          Config.headingSizeXLarge,
                                          FontWeight.w500,
                                          Config.colorWhite),
                                      CustomWidget.renderText(
                                          "12 - 15 December 2024, Gauteng Province",
                                          Config.headingSizeLarge,
                                          FontWeight.w300,
                                          Config.colorWhite),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
