import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_app_menu.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_menu.dart';
import 'package:hq_flutter_desktop_stu/plain_content/hq_plain_content.dart';

class HqAppMenuPage extends StatefulWidget {
  const HqAppMenuPage({super.key});

  @override
  State<HqAppMenuPage> createState() => _HqAppMenuPageState();
}

class _HqAppMenuPageState extends State<HqAppMenuPage> {
  late List<HqMenu> menus;
  late HqMenu currentMenu;
  late HqMenu currentSubMenu;
  bool mainMenuExpend = true;
  bool subMenuExpend = true;

  void createMenu2() {
    menus = [
      HqMenu('MSFS 2020', 0)
        ..bigTitle = '飞行模拟'
        ..subTitle = '运行平台'
        ..children = [
          HqMenu('ProSim', 0)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('Fenix', 1)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FlyByWire', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FLightSim Labs', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
        ],
      HqMenu(
        'MSFS 2024',
        1,
      )
        ..bigTitle = '飞行模拟'
        ..subTitle = '运行平台'
        ..children = [
          HqMenu('ProSim', 0)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('Fenix', 1)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FlyByWire', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FLightSim Labs', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
        ],
      HqMenu(
        'PSD',
        1,
      )
        ..bigTitle = '飞行模拟'
        ..subTitle = '运行平台'
        ..children = [
          HqMenu('ProSim', 0)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('Fenix', 1)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FlyByWire', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FLightSim Labs', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
        ],
      HqMenu(
        'X-Plane',
        2,
      )
        ..bigTitle = '飞行模拟'
        ..subTitle = '运行平台'
        ..children = [
          HqMenu('ProSim', 0)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('Fenix', 1)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FlyByWire', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
          HqMenu('FLightSim Labs', 2)
            ..subTitle = '机模选择'
            ..children = [
              HqMenu('LAZY', 0)..subTitle = '飞行模式',
              HqMenu('MAYDAY', 1)..subTitle = '飞行模式',
              HqMenu('TRAINING', 2)..subTitle = '飞行模式',
            ],
        ],
    ];

    currentMenu = menus[0];
    currentSubMenu = menus[0].children[0];
  }

  @override
  void initState() {
    createMenu2();
    super.initState();
  }

  List<HqMenu> selectedMenus = [];
  String slecteInfo() {
    return selectedMenus.map((e) {
      return e.label;
    }).join('->');
  }

  List<Widget> items = [];

  void _restSubMenu(HqMenu menu) {
    for (var element in menu.children) {
      element.selected = false;
      element.showChildren = false;
      if (element.children.isNotEmpty) {
        _restSubMenu(element);
      }
    }
  }

  Widget _buildPlainInfo() {
    String title = '您的飞行选择: ${slecteInfo()}';
    return Expanded(
      child: HqPlainContent(title: title),
    );
  }

  List<Widget> _buildSubItems() {
    return [
      HqAppMenu(
        menus: menus,
        onSelectedChanged: (index, selectedMenu) {
          currentMenu = selectedMenu;
          print('index: $index, selectedMenu: ${selectedMenu.label}');

          for (var element in menus) {
            _restSubMenu(element);
          }

          currentMenu.showChildren = true;
          currentSubMenu = currentMenu.children[0];
          mainMenuExpend = true;
          subMenuExpend = true;
          selectedMenus = [selectedMenu];

          setState(() {});
        },
        expend: mainMenuExpend,
      ),
      if (currentMenu.showChildren && currentMenu.children.isNotEmpty)
        HqAppMenu(
          menus: currentMenu.children,
          onSelectedChanged: (index, selectedSubMenu) {
            print('index: $index, selectedSubMenu: ${selectedSubMenu.label}');
            currentSubMenu = selectedSubMenu;
            _restSubMenu(currentSubMenu);
            currentSubMenu.showChildren = true;
            mainMenuExpend = false;
            subMenuExpend = true;
            selectedMenus = [currentMenu, currentSubMenu];
            setState(() {});
          },
          expend: subMenuExpend,
        ),
      if (currentSubMenu.showChildren && currentSubMenu.children.isNotEmpty)
        HqAppMenu(
          menus: currentSubMenu.children,
          onSelectedChanged: (index, selectedItemMenu) {
            print('index: $index, selectedItemMenu: ${selectedItemMenu.label}');
            selectedMenus = [currentMenu, currentSubMenu, selectedItemMenu];

            mainMenuExpend = false;
            subMenuExpend = false;
            setState(() {});
          },
        ),
      _buildPlainInfo()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: _buildSubItems(),
    )
        //
        );
  }
}
