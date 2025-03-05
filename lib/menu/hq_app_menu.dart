import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_menu.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_menu_item.dart';

class HqAppMenu extends StatefulWidget {
  final List<HqMenu> menus;
  bool expend;
  final void Function(int index, HqMenu menu)? onSelectedChanged;
  HqAppMenu(
      {super.key,
      required this.menus,
      this.onSelectedChanged,
      this.expend = true});

  @override
  State<HqAppMenu> createState() => _HqAppMenuState();
}

class _HqAppMenuState extends State<HqAppMenu> {
  late HqMenu currentMenu;
  double maxWidth = 180;
  double minWidth = 50;
  @override
  void initState() {
    currentMenu = widget.menus[0];
    super.initState();
  }

  List<Widget> _buildSubItems() {
    return widget.menus
        .map((e) => HqMenuItem(
              menu: e,
              expend: widget.expend,
              onTap: () {
                e.selected = true;
                widget.onSelectedChanged?.call(e.index, e);
                if (currentMenu == e) {
                } else {
                  currentMenu.selected = false;
                  currentMenu = e;
                }
                setState(() {});
              },
            ))
        .toList();
  }

  Widget _buildMenu(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: widget.expend ? maxWidth : minWidth,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ]),
      // https://medium.com/@sina.zrp/exploring-the-animatedcontainer-widget-in-flutter-a-comprehensive-guide-9ee7ecba93aa
      /* The OverflowBox ensures that the child widget maintains its size and aligns correctly within the AnimatedContainer.*/
      child: OverflowBox(
        alignment: Alignment.topLeft,
        maxWidth: maxWidth,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildSubItems(),
          ],
        )),
      ),
    );
  }

  List<Widget> _buildMenuHeader() {
    return [
      SizedBox(
        height: 90,
        width: 180,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              currentMenu.bigTitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      SizedBox(
          child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Text(
            currentMenu.subTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      )),
    ];
  }

  Widget _buildMenu1(BuildContext context) {
    return MouseRegion(
        onEnter: (event) {
          if (currentMenu.selected) {
            widget.expend = true;
            setState(() {});
          }
        },
        onExit: (event) {
          if (currentMenu.selected) {
            widget.expend = false;
            setState(() {});
          }
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: widget.expend ? maxWidth : minWidth,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
          // https://medium.com/@sina.zrp/exploring-the-animatedcontainer-widget-in-flutter-a-comprehensive-guide-9ee7ecba93aa
          /* The OverflowBox ensures that the child widget maintains its size and aligns correctly within the AnimatedContainer.*/
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: maxWidth,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._buildMenuHeader(),
                ..._buildSubItems(),
              ],
            )),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildMenu1(context);
  }
}
