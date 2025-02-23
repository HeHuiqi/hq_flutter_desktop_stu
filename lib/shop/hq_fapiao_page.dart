import 'package:flutter/material.dart';

class HqFapiaoTabsPage extends StatefulWidget {
  const HqFapiaoTabsPage({super.key});

  @override
  State<HqFapiaoTabsPage> createState() => _HqFapiaoTabsPageState();
}

class _HqFapiaoTabsPageState extends State<HqFapiaoTabsPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  PageStorageBucket bucket = PageStorageBucket();
  PageStorageKey<String> pageStorageKey = PageStorageKey<String>('page1');
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabBarView(
          controller: _controller,
          children: [
            PageStorage(
              bucket: PageStorageBucket(),
              child: const MyPage1(
                key: PageStorageKey<String>('page1'),
              ),
            ),
            PageStorage(
              bucket: PageStorageBucket(),
              child: const MyPage2(
                key: PageStorageKey<String>('page2'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: TabBar(
        controller: _controller,
        tabs: const [
          Tab(text: 'Page 1'),
          Tab(text: 'Page 2'),
        ],
      ),
    );
  }
}

class MyPage1 extends StatefulWidget {
  const MyPage1({super.key});

  @override
  State<MyPage1> createState() => _MyPage1State();
}

class _MyPage1State extends State<MyPage1> {
  int count = 0;
  @override
  void initState() {
    dynamic sc = PageStorage.of(context).readState(context);
    int cc = sc as int? ?? 0;
    count = cc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Count is $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
                PageStorage.of(context).writeState(context, count);
              });
            },
            child: const Text('Add 1'),
          ),
        ],
      ),
    );
  }
}

class MyPage2 extends StatefulWidget {
  const MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  int count = 0;
  @override
  void initState() {
    dynamic sc = PageStorage.of(context).readState(context);
    int cc = sc as int? ?? 0;
    count = cc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Count is $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
                PageStorage.of(context).writeState(context, count);
              });
            },
            child: const Text('Add 1'),
          ),
        ],
      ),
    );
  }
}
