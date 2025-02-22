import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_left_sub_menu.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_button.dart';

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
  String desc =
      '在全球航空产业持续创新与发展的背景下，motozolo 与 Airbus、ProSim 的战略合作展现了前瞻性视野。这一伙伴关系将帮助三方更好地应对未来市场的变化，抓住飞行培训行业的发展机遇，推动整个行业向更高水平迈进。motozolo 公司表示， 未来将继续秉持“协商、共建、共享”的发展理念，推动全球飞行模拟器行业的可持续发展。通过此次合作，motozolo 不仅增强了自身的技术能力，也为全球客户提供了更为完善的解决方案，助力飞行模拟器产业迈向新的高度。';
  Widget _content() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                // 'assets/images/airbus_a302.jpg',
                'assets/images/msfs2020.png',
                // fit: BoxFit.fitHeight,
              ),
              Container(
                  padding: EdgeInsets.only(top: 16, left: 26),
                  child: Text(
                    items[selectedIndex].label,
                    style: TextStyle(fontSize: 24),
                  )),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10, left: 26, right: 26),
                      child: Text(
                        desc,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          // 1.7倍行高
                          height: 1.7,
                          // 字间距
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 180,
              )
            ],
          ),
        ),
        Positioned(
          right: 40,
          bottom: 40,
          child: HqButton(
            borderWidth: 1,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
      backgroundColor: Colors.white,
    );
  }
}
