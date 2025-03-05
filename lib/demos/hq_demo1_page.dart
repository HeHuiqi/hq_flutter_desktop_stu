import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/demos/hq_sub_demo_page.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_slider_widget.dart';

///代码清单
class HqDemo1Page extends StatefulWidget {
  @override
  _HqDemo1PageState createState() => _HqDemo1PageState();
}

class _HqDemo1PageState extends State<HqDemo1Page>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isExPend = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        debugLabel: 'hhh-ani',
        vsync: this,
        duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizeTransition"),
      ),
      body: HqSliderWidget(),
      floatingActionButton: FloatingActionButton(
        child: Text("开始"),
        onPressed: () {
          _animationController.forward(from: 0);
        },
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Container(
          color: Colors.grey,
          height: 40,
          width: 400,
        ),
        Container(
          color: Colors.red,
          height: 40,
          width: 200,
        ),
      ],
    );
  }

  Widget _buildBody1() {
    return Container(
        color: Colors.red,
        height: 300,
        width: 800,
        // alignment: Alignment.bottomLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        isExPend = !isExPend;
                        if (isExPend) {
                          _animationController.forward(from: 0);
                          // _animationController.animateTo(1.0);
                        } else {
                          // _animationController.reverse(from: 0.5);
                          _animationController.reverse();
                          // _animationController.animateBack(0.5);
                        }
                      },
                      child: Text('1')),
                  ElevatedButton(
                      onPressed: () {
                        isExPend = !isExPend;
                        if (isExPend) {
                          _animationController.forward(from: 0);
                        } else {
                          _animationController.reverse();
                        }
                      },
                      child: Text('2')),
                ],
              ),
            ),
            SizeTransition(
              //偏移量
              axisAlignment: 1.0,
              //动画控制
              sizeFactor: _animationController,
              axis: Axis.horizontal,
              child: buildContainer(),
            ),
          ],
        ));
  }

  SizedBox buildContainer() {
    return SizedBox(
      child: InkWell(
        onTap: () {
          print("点击了");
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return HqSubDemoPage();
          }));
        },
        onHover: (value) {
          // print("value: $value");
          // isExPend = value;
          if (value) {
            // _animationController.animateTo(1.0);
          } else {
            // _animationController.animateBack(0.0);
          }
        },
        child: Container(
          color: Colors.yellow,
          width: 300,
          child: Column(
            children: [
              Text(
                "早起的年轻人",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "早起的年轻人",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "早起的年轻人",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
