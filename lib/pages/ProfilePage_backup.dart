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
            settingsSection(),
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
                      topLeft: Radius.circular(Config.defaultPadding * 2),
                      topRight: Radius.circular(Config.defaultPadding * 2)
                    )
                  ),
                  padding: const EdgeInsets.all(Config.defaultPadding),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        profileTopSection(),
                        profileSubMenus(),
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

  Container settingsSection(){
    return Container(
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
    );
  }

  Center profileTopSection(){
    return Center(
      child: SizedBox(
        width: Config.iconMediumSize * 8,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container profileSubMenus(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Config.defaultPadding * 2),
      decoration: BoxDecoration(
        border: Border.all(color: Color(Config.colorRed)),
      ),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: Config.defaultPadding * 0.5),
              padding: EdgeInsets.all(Config.defaultPadding),
              decoration: BoxDecoration(
                color: Color(Config.colorGold),
                border: Border.all(color: Color(Config.colorLightGrey)),
                borderRadius: BorderRadius.circular(Config.defaultPadding * 2)
              ),
              child: Text(
                'My Account',
                style: TextStyle(
                  fontSize: Config.headingSizeLarge
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: Config.defaultPadding * 0.5),
              padding: EdgeInsets.all(Config.defaultPadding),
              decoration: BoxDecoration(
                  color: Color(Config.colorGold),
                  border: Border.all(color: Color(Config.colorLightGrey)),
                  borderRadius: BorderRadius.circular(Config.defaultPadding * 2)
              ),
              child: Text(
                'Posts',
                style: TextStyle(
                    fontSize: Config.headingSizeLarge
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: Config.defaultPadding * 0.5),
              padding: EdgeInsets.all(Config.defaultPadding),
              decoration: BoxDecoration(
                  color: Color(Config.colorGold),
                  border: Border.all(color: Color(Config.colorLightGrey)),
                  borderRadius: BorderRadius.circular(Config.defaultPadding * 2)
              ),
              child: Text(
                'Favourites',
                style: TextStyle(
                    fontSize: Config.headingSizeLarge
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: Config.defaultPadding * 0.5),
              padding: EdgeInsets.all(Config.defaultPadding),
              decoration: BoxDecoration(
                  color: Color(Config.colorGold),
                  border: Border.all(color: Color(Config.colorLightGrey)),
                  borderRadius: BorderRadius.circular(Config.defaultPadding * 2)
              ),
              child: Text(
                'Activity',
                style: TextStyle(
                    fontSize: Config.headingSizeLarge
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
