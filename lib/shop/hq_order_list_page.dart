import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HqOrderListPage extends StatefulWidget {
  const HqOrderListPage({super.key});

  @override
  State<HqOrderListPage> createState() => _HqOrderListPageState();
}

class _HqOrderListPageState extends State<HqOrderListPage> {
  @override
  Widget build(BuildContext context) {
    //通过Navigator组件包裹可以实现子路由跳转
    // https://juejin.cn/post/7168662360230461454
    return Navigator(
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ListView(
                  children: List.generate(
                    50,
                    (index) => HqShopOrderListItem(index: index),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            );
          },
        );
      },
    );
  }
}

class HqShopOrderListItem extends StatefulWidget {
  final int index;
  const HqShopOrderListItem({super.key, required this.index});

  @override
  State<HqShopOrderListItem> createState() => _HqShopOrderListItemState();
}

class _HqShopOrderListItemState extends State<HqShopOrderListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: Icon(Icons.airplanemode_active),
        subtitle: Text('2023-05-01'),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text('订单 ${widget.index}'),
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('订单 ${widget.index}'),
                  ),
                  body: Center(
                    child: Text('订单详情页 '),
                  ),
                  backgroundColor: Colors.white,
                );
              },
            ),
          );
        },
      ),
      Divider(),
    ]);
  }
}
