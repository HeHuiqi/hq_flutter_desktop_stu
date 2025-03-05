import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> scoffoldKey = GlobalKey();

class HqSubDemoPage extends StatefulWidget {
  const HqSubDemoPage({Key? key, this.initValue = 0});

  final int initValue;

  @override
  _HqSubDemoPageState createState() => _HqSubDemoPageState();
}

class _HqSubDemoPageState extends State<HqSubDemoPage> {
  int _counter = 0;

  String icons = "1";
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
    // accessible: 0xe03e
    icons += "\uE03e";
// error:  0xe237
    icons += " \uE237";
// fingerprint: 0xe287
    icons += " \uE287";
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      key: scoffoldKey,
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 120.0),
            constraints:
                BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
            decoration: BoxDecoration(
              //背景装饰
              gradient: RadialGradient(
                //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98,
              ),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            // transform: Matrix4.rotationZ(.5), //卡片倾斜变换
            alignment: Alignment.center, //卡片内文字居中
            child: Text(
              //卡片文字
              "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
          Text('gdf'),
        ],
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scoffoldKey.currentState!.openDrawer();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            ),
          ], //均分底部导航栏横向空间
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(HqSubDemoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget ");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
