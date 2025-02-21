import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_left_sub_menu.dart';
import 'package:hq_flutter_desktop_stu/shop/hq_order_list_page.dart';
import 'package:hq_flutter_desktop_stu/shop/hq_shop_list_page.dart';

class HqContentPage2 extends StatefulWidget {
  const HqContentPage2({super.key});

  @override
  State<HqContentPage2> createState() => _HqContentPage2State();
}

class _HqContentPage2State extends State<HqContentPage2> {
  final List<LeftNavigationBarItem> items = [
    LeftNavigationBarItem(icon: Icons.message_outlined, label: '商品列表', id: 0),
    LeftNavigationBarItem(
        icon: Icons.video_camera_back_outlined, label: '我的订单', id: 1),
    LeftNavigationBarItem(icon: Icons.book_outlined, label: '我的发票', id: 2),
    LeftNavigationBarItem(icon: Icons.book_outlined, label: '我的飞行', id: 3),
    LeftNavigationBarItem(icon: Icons.book_outlined, label: '我的信息', id: 4),
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
    if (selectedIndex == 0) {
      return HqShopListPage();
    }
    if (selectedIndex == 1) {
      return HqOrderListPage();
    }
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
