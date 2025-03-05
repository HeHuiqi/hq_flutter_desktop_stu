import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_menu.dart';

class HqMenuItem extends StatefulWidget {
  final HqMenu menu;
  final void Function()? onTap;
  final void Function(bool)? onHover;
  final bool expend;
  const HqMenuItem(
      {super.key,
      required this.menu,
      required this.expend,
      this.onTap,
      this.onHover});

  @override
  State<HqMenuItem> createState() => _HqMenuItemState();
}

class _HqMenuItemState extends State<HqMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.menu.selected ? Colors.blue : Colors.white,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: InkWell(
          onTap: widget.onTap,
          onHover: widget.onHover,
          child: Row(
            children: [
              Icon(
                Icons.run_circle,
                color: widget.menu.selected ? Colors.white : Colors.black,
                size: 30,
              ),
              if (widget.expend)
                SizedBox(
                  // width: 60,
                  child: Text(
                    widget.menu.label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      color: widget.menu.selected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
            ],
          )),
    );
  }
}
