import 'package:flutter/material.dart';

class HqShopCartPage extends StatefulWidget {
  const HqShopCartPage({super.key});

  @override
  State<HqShopCartPage> createState() => _HqShopCartPageState();
}

class _HqShopCartPageState extends State<HqShopCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('我的购物车'),
      ),
    );
  }
}
