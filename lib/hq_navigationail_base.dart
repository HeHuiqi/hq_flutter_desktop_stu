import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_temp_page.dart';

//https://juejin.cn/post/7124097837389840397
class HqNavigationailBase extends StatefulWidget {
  const HqNavigationailBase({super.key});

  @override
  State<HqNavigationailBase> createState() => _HqNavigationailBaseState();
}

class _HqNavigationailBaseState extends State<HqNavigationailBase> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _selectIndex = ValueNotifier(0);
  bool _isExtended = false;
  final List<NavigationRailDestination> destinations = [
    NavigationRailDestination(
        icon: Icon(Icons.message_outlined), label: Text("消息")),
    NavigationRailDestination(
        icon: Icon(Icons.video_camera_back_outlined), label: Text("视频会议")),
    NavigationRailDestination(
        icon: Icon(Icons.book_outlined), label: Text("通讯录")),
    NavigationRailDestination(
        icon: Icon(Icons.cloud_upload_outlined), label: Text("云文档")),
    NavigationRailDestination(
        icon: Icon(Icons.games_sharp), label: Text("工作台")),
    NavigationRailDestination(
        icon: Icon(Icons.calendar_month), label: Text("日历"))
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //监听页面切换
      int index = _controller.page?.toInt() ?? 0;
      if (index != _selectIndex.value) {
        _selectIndex.value = index;
      }
    });
  }

  Widget _buildLeftNavigation(int index) {
    return NavigationRail(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          setState(() {
            //切换导航栏的展开状态
            _isExtended = !_isExtended;
          });
        },
      ),
      minExtendedWidth: 146,
      // 阴影宽度
      elevation: 10,
      trailing: FlutterLogo(),
      extended: _isExtended,
      onDestinationSelected: _onDestinationSelected,
      destinations: destinations,
      selectedIndex: index,
      //这歌属性为all时，label会一直显示，为selected时，只有选中的label会显示，为none时，label不会显示
      // extended 为true时，labelType只能为none
      // labelType: NavigationRailLabelType.all,
    );
  }

  void _onDestinationSelected(int value) {
    //更新索引 + 切换界面
    _controller.jumpToPage(value); // tag1
    _selectIndex.value = value; //tag2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        ValueListenableBuilder<int>(
          valueListenable: _selectIndex,
          builder: (_, index, __) => _buildLeftNavigation(index),
        ),
        VerticalDivider(thickness: 1, width: 1),
        Expanded(
            child: PageView(
          controller: _controller,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HqTempPage()));
              },
              child: TestContent(
                content: '消息',
              ),
            ),
            TestContent(
              content: '视频会议',
            ),
            TestContent(
              content: '通讯录',
            ),
            TestContent(
              content: '云文档',
            ),
            TestContent(
              content: '工作台',
            ),
            TestContent(
              content: '日历',
            ),
          ],
        ))
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectIndex.dispose();
    super.dispose();
  }
}

class TestContent extends StatelessWidget {
  final String content;

  const TestContent({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(content),
    );
  }
}
