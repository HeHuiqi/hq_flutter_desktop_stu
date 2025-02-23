import 'package:flutter/material.dart';

class HqTabPage extends StatefulWidget {
  const HqTabPage({super.key});

  @override
  State<HqTabPage> createState() => _HqTabPageState();
}

class _HqTabPageState extends State<HqTabPage>
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
            // const MyPage1(),
            // const MyPage2(),
            KeepAliveWrapper(
              keepAlive: true,
              child: MyTabPage(
                index: 0,
              ),
            ),
            KeepAliveWrapper(
              keepAlive: true,
              child: MyTabPage(
                index: 1,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.only(top: 40),
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.orange],
          ),
        ),
        controller: _controller,
        tabs: const [
          Tab(
            text: 'TabPage 1',
            height: 40,
          ),
          Tab(
            text: 'TabPage 2',
            height: 40,
          ),
        ],
      ),
    );
  }
}

// https://book.flutterchina.club/chapter6/keepalive.html#_6-8-2-keepalivewrapper
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    super.key,
    this.keepAlive = true,
    required this.child,
  });
  final bool keepAlive;
  final Widget child;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}

class MyTabPage extends StatefulWidget {
  final int index;
  const MyTabPage({super.key, required this.index});

  @override
  State<MyTabPage> createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage> {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MyTabPage ${widget.index} build");
    return Center(
      child: Column(
        children: [
          Text('Count is $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Text('Add 1'),
          ),
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

class _MyPage1State extends State<MyPage1> with AutomaticKeepAliveClientMixin {
  // https://blog.51cto.com/jdsjlzx/5685619
  // https://blog.csdn.net/weixin_44350337/article/details/113727726
  // https://blog.csdn.net/qq_32760901/article/details/97751743
  // 当页面被切换时，保持页面状态不变
  @override
  bool get wantKeepAlive => true;
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("tab page 1 build");
    super.build(context);
    return Center(
      child: Column(
        children: [
          Text('Count is $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
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

class _MyPage2State extends State<MyPage2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("tab page 2 build");
    super.build(context);
    return Center(
      child: Column(
        children: [
          Text('Count is $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
                // PageStorage.of(context).writeState(context, count);
              });
            },
            child: const Text('Add 1'),
          ),
        ],
      ),
    );
  }
}
