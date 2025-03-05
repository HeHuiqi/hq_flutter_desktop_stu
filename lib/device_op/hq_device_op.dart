import 'package:flutter/material.dart';

class HqDeviceOpPage extends StatefulWidget {
  const HqDeviceOpPage({super.key});

  @override
  State<HqDeviceOpPage> createState() => _HqDeviceOpPageState();
}

class _HqDeviceOpPageState extends State<HqDeviceOpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(children: [
      Image.asset('assets/images/device_op.jpg'),
      Positioned(
        top: 143,
        left: 250,
        child: Container(
          width: 89,
          height: 65,
          color: Colors.red,
        ),
      )
    ])));
  }
}
