import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/keys/hq_global_key.dart';
import 'package:hq_flutter_desktop_stu/status/hq_shop_cart_notifier.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_border_button.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_button.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_shop_number_op.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_shop_type_slected.dart';
import 'package:provider/provider.dart';
import 'package:windows_toast/windows_toast.dart';

class HqShopDetailPage extends StatefulWidget {
  const HqShopDetailPage({super.key});

  @override
  State<HqShopDetailPage> createState() => _HqShopDetailPageState();
}

class _HqShopDetailPageState extends State<HqShopDetailPage> {
  int _selectedIndex = 0;
  int _buyShopCount = 1;
  final List<String> _imagePaths = [
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-1.png', // 替换为实际图片路径
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-2.png',
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-3.png',
    'https://storage.motozolo.com/cms/image/100000001-1280-1280-4.png',
  ];

  void _showToast(BuildContext context, {String message = '请登录后再购买吧！'}) {
    BuildContext ct = navigatorStateKey.currentState?.context ?? context;

    WindowsToast.show(message, ct, 100);
  }

  void _goLogin(BuildContext context) {
    BuildContext ct = navigatorStateKey.currentState?.context ?? context;
    Navigator.of(ct).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('登录'),
            ),
            body: Center(
              child: Text('开始登录'),
            ),
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.white, scrolledUnderElevation: 0.0),
      body: SingleChildScrollView(
        child: Column(children: [
          _buildHeader(),
          SizedBox(height: 10),
          _buildFooter(),
        ]),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildShopImageInfo() {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            _imagePaths[_selectedIndex],
            fit: BoxFit.contain,
          ),
        ),
        Center(
            child: SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
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
        )),
      ],
    );
  }

  List<Widget> _buildFuncInfo() {
    return [
      Chip(
          avatar: Icon(Icons.airplanemode_active),
          label: Text('快速简单的安装'),
          backgroundColor: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.white),
          )),
      SizedBox(
        height: 10,
      ),
      Chip(
          avatar: Icon(Icons.lock_clock),
          label: Text('通过数字下载即时访问'),
          backgroundColor: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.white),
          )),
      SizedBox(
        height: 10,
      ),
      Chip(
          avatar: Icon(Icons.collections),
          label: Text('免费产品更新和支持'),
          backgroundColor: Colors.white,
          shape: StadiumBorder(
            side: BorderSide(color: Colors.white),
          )),
    ];
  }

  List<Widget> _buildShopOps() {
    return [
      ElevatedButton.icon(
        onPressed: () {
          //获取提供者
          HqShopCartNotifier shopCart = context.read<HqShopCartNotifier>();
          print("_buyShopCount:$_buyShopCount");
          //改变值，触发通知
          shopCart.addShopCount(_buyShopCount);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          foregroundColor: WidgetStateProperty.all(Colors.blue),
          minimumSize: WidgetStateProperty.all(Size(240, 56)),
          padding: WidgetStateProperty.all(EdgeInsets.all(0)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          )),
        ),
        label: Text(
          '加入购物车',
          style: TextStyle(fontSize: 16),
        ),
        icon: Icon(
          Icons.add_shopping_cart,
          size: 24,
          color: Colors.blue,
        ),
        iconAlignment: IconAlignment.start,
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.orange),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          minimumSize: WidgetStateProperty.all(Size(240, 56)),
          padding: WidgetStateProperty.all(EdgeInsets.all(0)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide.none,
          )),
        ),
        label: Text(
          '立即购买',
          style: TextStyle(fontSize: 16),
        ),
        icon: Icon(
          Icons.payment,
          size: 24,
          color: Colors.white,
        ),
        iconAlignment: IconAlignment.start,
      ),
    ];
  }

  Widget _buildShopTypeSlectedInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('mini FTD',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        Row(
          children: [
            const Text('商品支持：'),
            Chip(
                avatar: Icon(Icons.check_circle_outline),
                label: Text('正品保障'),
                backgroundColor: Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white),
                )),
            Chip(
                avatar: Icon(Icons.check_circle_outline),
                label: Text('便捷配送'),
                backgroundColor: Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white),
                )),
            Chip(
                avatar: Icon(Icons.check_circle_outline),
                label: Text('售后无忧'),
                backgroundColor: Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.white),
                )),
          ],
        ),
        RichText(
          text: TextSpan(
            text: '价格：',
            style: TextStyle(color: Colors.black, fontSize: 26),
            children: <TextSpan>[
              TextSpan(
                text: 'CNY 28888',
                style: TextStyle(
                  color: const Color(0xffde5b13),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 1,
          endIndent: 40,
        ),
        SizedBox(
          height: 10,
        ),
        ..._buildFuncInfo(),
        SizedBox(height: 15),
        HqShopTypeSlected(title: '型号:', items: ['A302']),
        SizedBox(
          height: 15,
        ),
        HqShopTypeSlected(
            title: '颜色:', items: ['黑色', '白色', '红色', '绿色', '蓝色', '紫色']),
        SizedBox(
          height: 15,
        ),
        HqShopTypeSlected(title: '容量:', items: ['128G', '256G', '512G', '1T']),
        SizedBox(
          height: 15,
        ),
        HqShopNumberOp(
          onChanged: (ct) {
            print('onChanged:$ct');
            _buyShopCount = ct;
          },
        ),
        SizedBox(
          height: 40,
        ),
        ..._buildShopOps(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(children: [
      Expanded(
          child: SizedBox(
        height: 600,
        child: _buildShopImageInfo(),
      )),
      // Expanded(child: SizedBox(height: 800, child: _buildShopTypeSlectedInfo())),
      Expanded(child: _buildShopTypeSlectedInfo()),
    ]);
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40),
              width: 140,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4))),
              child: Center(
                child: Text(
                  '商品详情',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Expanded(
                child: Container(
              height: 1,
              color: Colors.blue,
            )),
            SizedBox(
              width: 40,
            )
          ],
        ),
        ..._imagePaths.map((path) {
          return Container(
            //color: Colors.red,
            // height: 800,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.white, width: 1))),
            child: Image.network(
              path,
              height: 800,
              fit: BoxFit.fitHeight,
            ),
          );
        }),
      ],
    );
  }
}
