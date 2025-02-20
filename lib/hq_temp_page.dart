import 'package:flutter/material.dart';

class HqTempPage extends StatefulWidget {
  const HqTempPage({super.key});

  @override
  State<HqTempPage> createState() => _HqTempPageState();
}

class _HqTempPageState extends State<HqTempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("临时页面"),
      ),
      body: Center(
        child: Text("临时页面"),
      ),
    );
  }
}
