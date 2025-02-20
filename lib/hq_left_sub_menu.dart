import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';

class HqLeftSubMenu extends StatefulWidget {
  final List<LeftNavigationBarItem> items;
  final void Function(int index)? onSelectedIndex;
  const HqLeftSubMenu({Key? key, required this.items, this.onSelectedIndex})
      : super(key: key);

  static HqLeftSubMenu defaultMenu([Function(int index)? onSelectedIndex]) {
    final List<LeftNavigationBarItem> items = [
      LeftNavigationBarItem(
          icon: Icons.message_outlined, label: '消息-sub1', id: 0),
      LeftNavigationBarItem(
          icon: Icons.video_camera_back_outlined, label: '消息-sub2', id: 1),
      LeftNavigationBarItem(icon: Icons.book_outlined, label: '消息-sub3', id: 2),
    ];
    return HqLeftSubMenu(
      items: items,
      onSelectedIndex: onSelectedIndex,
    );
  }

  @override
  State<HqLeftSubMenu> createState() => _HqLeftSubMenuState();
}

class _HqLeftSubMenuState extends State<HqLeftSubMenu> {
  int seleftedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        color: Colors.white,
        child: Column(
          children: widget.items
              .map((e) => HqLeftSuMenuItem(
                    item: e,
                    onTap: () {
                      setState(() {
                        widget.onSelectedIndex?.call(e.id);
                        seleftedIndex = e.id;
                      });
                    },
                    active: e.id == seleftedIndex,
                  ))
              .toList(),
        ));
  }
}

class HqLeftSuMenuItem extends StatefulWidget {
  final LeftNavigationBarItem item;
  final bool active;
  final void Function()? onTap;
  const HqLeftSuMenuItem(
      {super.key, required this.item, this.active = false, this.onTap});

  @override
  State<HqLeftSuMenuItem> createState() => _HqLeftSuMenuItemState();
}

class _HqLeftSuMenuItemState extends State<HqLeftSuMenuItem> {
  bool _isHover = false;
  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  void _onHover(bool isHover) {
    setState(() {
      _isHover = isHover;
    });
  }

  bool get active => _isHover || widget.active;
  @override
  Widget build(BuildContext context) {
    // const Color color = Color.fromARGB(255, 64, 81, 191);
    const Color color = Colors.white;

    const Color activeColor = Colors.blue;
    return Container(
      height: 50,
      width: 120,
      child: InkWell(
          onTap: _onTap,
          onHover: _onHover,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8),
                  color: active ? activeColor : color),
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.item.label,
                    style: TextStyle(
                      color: active ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  )
                ],
              ))),
    );
  }
}
