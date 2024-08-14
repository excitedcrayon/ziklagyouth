import 'package:flutter/material.dart';
import 'package:ziklagyouth/widgets/CustomWidget.dart';

import '../config/config.dart';

class Contactspage extends StatefulWidget {
  const Contactspage({Key? key}) : super(key: key);

  @override
  State<Contactspage> createState() => _ContactspageState();
}

class _ContactspageState extends State<Contactspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Config.defaultPadding),
          child: Column(
            children: <Widget>[
              //CustomWidget.renderText(myText, fontSize, myWeight, myColor)
              CustomWidget.renderText(
                Config.contactsPageHeading,
                Config.headingSizeXLarge,
                FontWeight.w400,
                Config.colorBlack
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: Config.defaultPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(Config.colorDarkGrey)),
                  borderRadius: BorderRadius.circular(Config.defaultPadding * 5)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none
                  ),
                ),
              ),
              /*
              Container(
                height: 80.0,
                decoration: BoxDecoration(
                  color: const Color(Config.colorLightGrey),
                  border: Border.all(color: const Color(Config.colorDarkGrey)),
                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: Config.iconMediumSize,
                        height: Config.iconMediumSize,
                        margin: EdgeInsets.all(Config.defaultPadding / 2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://media.licdn.com/dms/image/C5603AQHg_gI79tmGFQ/profile-displayphoto-shrink_200_200/0/1636400845736?e=2147483647&v=beta&t=zQzniPO7dkotUUv7H-4m9TvVKdH6MikP2Gch0XazFeI')
                          ),
                          border: Border.all(color: Color(Config.colorGold)),
                          shape: BoxShape.circle
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomWidget.renderText("Bongani", Config.headingSizeLarge, FontWeight.w300, Config.colorBlack),
                          CustomWidget.renderText("1000 Contacts", Config.headingSizeLarge / 1.3, FontWeight.w500, Config.colorBlack),
                        ],
                      ),
                    ),
                  ],
                ),
              ), */
              Container(
                margin: const EdgeInsets.only(
                  top: Config.defaultPadding
                ),
                child: CustomWidget.renderText(
                  Config.favouritesHeading,
                  0.0,
                  FontWeight.w300,
                  Config.colorBlack
                ),
              ),
              Container(
                width: double.infinity,
                height: Config.cardHeight * 0.6,
                margin: const EdgeInsets.symmetric(vertical: Config.defaultPadding),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: Config.defaultPadding * 0.4),
                      child: SizedBox(
                        width: Config.cardWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: Config.cardWidth / 2,
                              height: Config.cardHeight * 0.4,
                              padding: const EdgeInsets.all(Config.defaultPadding * 0.2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(Config.colorGold)),
                                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Color(Config.colorGold).withOpacity(0.5),
                                        size: Config.defaultPadding * 0.8,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: Config.iconMediumSize,
                                      height: Config.iconMediumSize,
                                      decoration: BoxDecoration(
                                          color: const Color(Config.colorGold).withOpacity(0.5),
                                          border: Border.all(color: Color(Config.colorGold)),
                                          shape: BoxShape.circle,
                                        image: const DecorationImage(
                                          image: NetworkImage('https://content.api.news/v3/images/bin/932494dabdd869672792aae111dc9ca5?width=768'),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding * 0.2),
                              child: CustomWidget.renderText(
                                "Dennis Hogan",
                                Config.headingSizeLarge * 0.6,
                                FontWeight.w300,
                                Config.colorBlack
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Config.defaultPadding * 0.4),
                      child: SizedBox(
                        width: Config.cardWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: Config.cardWidth / 2,
                              height: Config.cardHeight * 0.4,
                              padding: const EdgeInsets.all(Config.defaultPadding * 0.2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(Config.colorGold)),
                                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Color(Config.colorGold).withOpacity(0.5),
                                        size: Config.defaultPadding * 0.8,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: Config.iconMediumSize,
                                      height: Config.iconMediumSize,
                                      decoration: BoxDecoration(
                                          color: const Color(Config.colorGold).withOpacity(0.5),
                                          border: Border.all(color: Color(Config.colorGold)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: NetworkImage('https://content.api.news/v3/images/bin/932494dabdd869672792aae111dc9ca5?width=768'),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding * 0.2),
                              child: CustomWidget.renderText(
                                  "Dennis Hogan",
                                  Config.headingSizeLarge * 0.6,
                                  FontWeight.w300,
                                  Config.colorBlack
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Config.defaultPadding * 0.4),
                      child: SizedBox(
                        width: Config.cardWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: Config.cardWidth / 2,
                              height: Config.cardHeight * 0.4,
                              padding: const EdgeInsets.all(Config.defaultPadding * 0.2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(Config.colorGold)),
                                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Color(Config.colorGold).withOpacity(0.5),
                                        size: Config.defaultPadding * 0.8,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: Config.iconMediumSize,
                                      height: Config.iconMediumSize,
                                      decoration: BoxDecoration(
                                          color: const Color(Config.colorGold).withOpacity(0.5),
                                          border: Border.all(color: Color(Config.colorGold)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: NetworkImage('https://content.api.news/v3/images/bin/932494dabdd869672792aae111dc9ca5?width=768'),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding * 0.2),
                              child: CustomWidget.renderText(
                                  "Dennis Hogan",
                                  Config.headingSizeLarge * 0.6,
                                  FontWeight.w300,
                                  Config.colorBlack
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Config.defaultPadding * 0.4),
                      child: SizedBox(
                        width: Config.cardWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: Config.cardWidth / 2,
                              height: Config.cardHeight * 0.4,
                              padding: const EdgeInsets.all(Config.defaultPadding * 0.2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(Config.colorGold)),
                                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Color(Config.colorGold).withOpacity(0.5),
                                        size: Config.defaultPadding * 0.8,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: Config.iconMediumSize,
                                      height: Config.iconMediumSize,
                                      decoration: BoxDecoration(
                                          color: const Color(Config.colorGold).withOpacity(0.5),
                                          border: Border.all(color: Color(Config.colorGold)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: NetworkImage('https://content.api.news/v3/images/bin/932494dabdd869672792aae111dc9ca5?width=768'),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding * 0.2),
                              child: CustomWidget.renderText(
                                  "Dennis Hogan",
                                  Config.headingSizeLarge * 0.6,
                                  FontWeight.w300,
                                  Config.colorBlack
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Config.defaultPadding * 0.4),
                      child: SizedBox(
                        width: Config.cardWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: Config.cardWidth / 2,
                              height: Config.cardHeight * 0.4,
                              padding: const EdgeInsets.all(Config.defaultPadding * 0.2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(Config.colorGold)),
                                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Color(Config.colorGold).withOpacity(0.5),
                                        size: Config.defaultPadding * 0.8,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: Config.iconMediumSize,
                                      height: Config.iconMediumSize,
                                      decoration: BoxDecoration(
                                          color: const Color(Config.colorGold).withOpacity(0.5),
                                          border: Border.all(color: Color(Config.colorGold)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: NetworkImage('https://content.api.news/v3/images/bin/932494dabdd869672792aae111dc9ca5?width=768'),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding * 0.2),
                              child: CustomWidget.renderText(
                                  "Dennis Hogan",
                                  Config.headingSizeLarge * 0.6,
                                  FontWeight.w300,
                                  Config.colorBlack
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: Config.defaultPadding * 0.4),
                      child: SizedBox(
                        width: Config.cardWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: Config.cardWidth / 2,
                              height: Config.cardHeight * 0.4,
                              padding: const EdgeInsets.all(Config.defaultPadding * 0.2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: const Color(Config.colorGold)),
                                  borderRadius: BorderRadius.circular(Config.defaultPadding)
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Icon>[
                                      Icon(
                                        Icons.star,
                                        color: Color(Config.colorGold).withOpacity(0.5),
                                        size: Config.defaultPadding * 0.8,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: Config.iconMediumSize,
                                      height: Config.iconMediumSize,
                                      decoration: BoxDecoration(
                                          color: const Color(Config.colorGold).withOpacity(0.5),
                                          border: Border.all(color: Color(Config.colorGold)),
                                          shape: BoxShape.circle,
                                          image: const DecorationImage(
                                              image: NetworkImage('https://content.api.news/v3/images/bin/932494dabdd869672792aae111dc9ca5?width=768'),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Config.defaultPadding * 0.2),
                              child: CustomWidget.renderText(
                                  "Dennis Hogan",
                                  Config.headingSizeLarge * 0.6,
                                  FontWeight.w300,
                                  Config.colorBlack
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

