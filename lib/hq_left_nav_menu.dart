import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/shop_cart/hq_shop_cart_page.dart';
import 'package:hq_flutter_desktop_stu/status/hq_shop_cart_notifier.dart';
import 'package:provider/provider.dart';

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
  const HqLeftNavMenu({super.key, required this.items, this.onSelectedIndex});
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

  Widget _buildItems() {
    return Column(
      children: widget.items
          .map((e) => HqLeftNavSubMenuItem(
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
    );
  }

  Widget _buildShopCart(BuildContext context) {
    return Consumer<HqShopCartNotifier>(builder: (context, shopCart, child) {
      return SizedBox(
          height: 80,
          width: 80,
          child: Stack(
            children: [
              IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HqShopCartPage();
                  }));
                },
              ),
              if (shopCart.shopCount > 0)
                Positioned(
                    right: 25,
                    top: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '${shopCart.shopCount}',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ))
            ],
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 64, 81, 191),
      // padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItems(),
          _buildShopCart(context),
        ],
      ),
    );
  }
}

class HqLeftNavSubMenuItem extends StatefulWidget {
  final LeftNavigationBarItem item;
  final bool active;
  final void Function()? onTap;
  const HqLeftNavSubMenuItem(
      {super.key, required this.item, this.active = false, this.onTap});

  @override
  State<HqLeftNavSubMenuItem> createState() => _HqLeftNavSubMenuItemState();
}

class _HqLeftNavSubMenuItemState extends State<HqLeftNavSubMenuItem> {
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
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      colors: active
                          ? [Colors.blue, Colors.red]
                          : [Colors.transparent, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
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
