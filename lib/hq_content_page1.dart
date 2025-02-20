import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_left_sub_menu.dart';

class HqContentPage1 extends StatefulWidget {
  const HqContentPage1({super.key});

  @override
  State<HqContentPage1> createState() => _HqContentPage1State();
}

class _HqContentPage1State extends State<HqContentPage1> {
  final List<LeftNavigationBarItem> items = [
    LeftNavigationBarItem(
        icon: Icons.message_outlined, label: 'MSFS 2020', id: 0),
    LeftNavigationBarItem(
        icon: Icons.video_camera_back_outlined, label: 'MSFS 2024', id: 1),
    LeftNavigationBarItem(icon: Icons.book_outlined, label: 'PSD', id: 2),
  ];
  int selectedIndex = 0;
  // Widget _content() {
  //   switch (selectedIndex) {
  //     case 0:
  //       return Text('会议-sub1');
  //     case 1:
  //       return Text('会议-sub2');
  //     case 2:
  //       return Text('会议-sub3');
  //     default:
  //       return Text('会议');
  //   }
  // }
  Widget _content() {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset('assets/images/msfs2020.png', fit: BoxFit.cover),
            Text(items[selectedIndex].label),
          ],
        ),
        Positioned(
          right: 50,
          bottom: 50,
          child: ElevatedButton(
            onPressed: () {
              print('click');
            },
            child: Text('启动开始飞行'),
          ),
        )
      ],
    );
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
