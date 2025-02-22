import 'package:flutter/material.dart';

class HqDemoPage extends StatefulWidget {
  const HqDemoPage({super.key});

  @override
  _HqDemoPageState createState() => _HqDemoPageState();
}

class _HqDemoPageState extends State<HqDemoPage> {
  int _selectedIndex = 0;
  final List<String> _imagePaths = [
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-1.png', // 替换为实际图片路径
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-2.png',
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-3.png',
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Switcher'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              _imagePaths[_selectedIndex],
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      _imagePaths[index],
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
