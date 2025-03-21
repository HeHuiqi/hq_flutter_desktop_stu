import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hq_flutter_desktop_stu/device_op/hq_device_op.dart';

import 'package:hq_flutter_desktop_stu/hq_content_page1.dart';
import 'package:hq_flutter_desktop_stu/hq_content_page2.dart';
import 'package:hq_flutter_desktop_stu/hq_content_page3.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_app_menu_page.dart';
import 'package:hq_flutter_desktop_stu/settings/hq_setting_page.dart';

class HqMainPage extends StatefulWidget {
  const HqMainPage({super.key});

  @override
  State<HqMainPage> createState() => _HqMainPageState();
}

class _HqMainPageState extends State<HqMainPage> {
  Widget _contentPage() {
    switch (_selectedIndex) {
      case 0:
        // return HqContentPage1();
        return HqAppMenuPage();
      case 1:
        return HqContentPage2();
      case 2:
        return HqContentPage3();
      default:
        return HqContentPage1();
    }
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("摩陀娑罗", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
              //return HqSettingPage();
              return HqDeviceOpPage();
            }));
          },
          child: Container(
              margin: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 11, 18, 32),
                child: Image.asset(
                  'assets/images/app_logo.gif',
                  width: 40,
                  height: 40,
                  fit: BoxFit.fitHeight,
                ),
              )),
        ),
      ),
      body: Row(children: <Widget>[
        HqLeftNavMenu.defaultMenu((index) {
          print('index: $index');
          setState(() {
            _selectedIndex = index;
          });
        }),
        // VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: _contentPage(),
        )
      ]),
    );
  }
}
