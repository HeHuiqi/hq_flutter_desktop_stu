import 'package:flutter/material.dart';

class LeftNavigationBarItem {
  final int id;
  final IconData icon;
  final String label;

  const LeftNavigationBarItem({
    required this.icon,
    required this.label,
    required this.id,
  });
}

class HqLeftNavMenu extends StatefulWidget {
  final List<LeftNavigationBarItem> items;
  final void Function(int index)? onSelectedIndex;
  const HqLeftNavMenu({Key? key, required this.items, this.onSelectedIndex})
      : super(key: key);
  static HqLeftNavMenu defaultMenu([Function(int index)? onSelectedIndex]) {
    return HqLeftNavMenu(
      items: [
        LeftNavigationBarItem(icon: Icons.run_circle, label: '运行', id: 0),
        LeftNavigationBarItem(icon: Icons.shop, label: '商城', id: 1),
        LeftNavigationBarItem(icon: Icons.hardware, label: '固件', id: 2),
        // LeftNavigationBarItem(
        //     icon: Icons.cloud_upload_outlined, label: '云文档', id: 3),
        // LeftNavigationBarItem(icon: Icons.games_sharp, label: '工作台', id: 4),
        // LeftNavigationBarItem(icon: Icons.calendar_month, label: '日历', id: 5),
      ],
      onSelectedIndex: onSelectedIndex,
    );
  }

  @override
  State<HqLeftNavMenu> createState() => _HqLeftNavMenuState();
}

class _HqLeftNavMenuState extends State<HqLeftNavMenu> {
  int seleftedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 64, 81, 191),
      // padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: widget.items
            .map((e) => LeftNavigationBarItemWidget(
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
      ),
    );
  }
}

class LeftNavigationBarItemWidget extends StatefulWidget {
  final LeftNavigationBarItem item;
  final bool active;
  final void Function()? onTap;
  const LeftNavigationBarItemWidget(
      {super.key, required this.item, this.active = false, this.onTap});

  @override
  State<LeftNavigationBarItemWidget> createState() =>
      _LeftNavigationBarItemWidgetState();
}

class _LeftNavigationBarItemWidgetState
    extends State<LeftNavigationBarItemWidget> {
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
    const Color color = Color.fromARGB(255, 64, 81, 191);
    const Color activeColor = Colors.blue;
    return Container(
      height: 50,
      width: 90,
      // padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
      child: InkWell(
          onTap: _onTap,
          onHover: _onHover,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8),
                  color: active ? activeColor : color),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(widget.item.icon,
                      color: active ? Colors.white : Colors.white),
                  SizedBox(width: 8),
                  Text(
                    widget.item.label,
                    style: TextStyle(
                      color: active ? Colors.white : Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ))),
    );
  }
}
