import 'package:flutter/material.dart';
import 'package:ziklagyouth/config/config.dart';
import 'package:ziklagyouth/widgets/CustomWidget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: Config.defaultPadding * 4.5,
              decoration: const BoxDecoration(
                color: Color(Config.colorGold),
              ),
              child: const Padding(
                padding: EdgeInsets.all(Config.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Config.defaultPadding * 1.2
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.settings,
                        size: Config.iconSize * 1.5,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(Config.colorGold),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(Config.colorWhite),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Config.defaultPadding),
                      topRight: Radius.circular(Config.defaultPadding)
                    )
                  ),
                  padding: const EdgeInsets.all(Config.defaultPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        profileTopSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center profileTopSection(){
    return Center(
      child: SizedBox(
        width: Config.iconMediumSize * 8,
        height: Config.iconMediumSize * 8,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.symmetric(
                  vertical: Config.defaultPadding
              ),
              width: Config.iconMediumSize * 4,
              height: Config.iconMediumSize * 4,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(Config.colorGold),
                    width: 4.0,
                  ),
                  image: DecorationImage(
                      image: NetworkImage('https://media.licdn.com/dms/image/C5603AQHg_gI79tmGFQ/profile-displayphoto-shrink_200_200/0/1636400845736?e=2147483647&v=beta&t=zQzniPO7dkotUUv7H-4m9TvVKdH6MikP2Gch0XazFeI'),
                      fit: BoxFit.cover
                  ),
                  shape: BoxShape.circle
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Bongani Mkonto",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: Config.headingSizeLarge * 1.3,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "Queensland Section",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(Config.colorBlack).withOpacity(0.5),
                        fontSize: Config.headingSizeLarge,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "Australasia",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(Config.colorBlack).withOpacity(0.5),
                        fontSize: Config.headingSizeLarge * 0.9,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
