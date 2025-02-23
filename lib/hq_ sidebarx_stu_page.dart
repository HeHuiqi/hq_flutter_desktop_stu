import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class HqSiderBarPage extends StatefulWidget {
  const HqSiderBarPage({super.key});

  @override
  State<HqSiderBarPage> createState() => _HqSiderBarPageState();
}

class _HqSiderBarPageState extends State<HqSiderBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          // Your app screen body
        ],
      ),
    );
  }
}
