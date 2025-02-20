import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_left_sub_menu.dart';

class HqContentPage3 extends StatefulWidget {
  const HqContentPage3({super.key});

  @override
  State<HqContentPage3> createState() => _HqContentPage3State();
}

class _HqContentPage3State extends State<HqContentPage3> {
  final List<LeftNavigationBarItem> items = [
    LeftNavigationBarItem(icon: Icons.message_outlined, label: '在线升级', id: 0),
    LeftNavigationBarItem(
        icon: Icons.video_camera_back_outlined, label: '固件绑定', id: 1),
    LeftNavigationBarItem(icon: Icons.book_outlined, label: '固件解绑', id: 2),
  ];
  int selectedIndex = 0;
  // Widget _content() {
  //   switch (selectedIndex) {
  //     case 0:
  //       return Text('通讯-sub1');
  //     case 1:
  //       return Text('通讯-sub2');
  //     case 2:
  //       return Text('通讯-sub3');
  //     default:
  //       return Text('通讯');
  //   }
  // }
  Widget _content() {
    return Text(items[selectedIndex].label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          HqLeftSubMenu(
            items: items,
            onSelectedIndex: (index) {
              print('submenu-index: $index');
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: _content(),
            ),
          )
        ],
      ),
    );
  }
}
