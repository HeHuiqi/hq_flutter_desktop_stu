import 'package:flutter/material.dart';

class HqShopListPage extends StatefulWidget {
  const HqShopListPage({super.key});

  @override
  State<HqShopListPage> createState() => _HqShopListPageState();
}

class _HqShopListPageState extends State<HqShopListPage> {
  @override
  Widget build(BuildContext context) {
    //通过Navigator组件包裹可以实现子路由跳转
    // https://juejin.cn/post/7168662360230461454
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
                body: SizedBox(
              width: 1064,
              child: GridView.count(
                crossAxisCount: 4,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  50,
                  (index) => HqShopOrderListItem(index: index),
                ),
              ),
            ));
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
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('订单 ${widget.index}'),
                  ),
                  body: Center(
                    child: Text('订单 ${widget.index}'),
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          color: const Color.fromARGB(255, 164, 54, 215),
          padding: EdgeInsets.only(top: 4),
          child: Column(
            children: [
              Image.asset('assets/images/shop_item.png',
                  height: 200, fit: BoxFit.fitHeight),
              Text('商品 ${widget.index}'),
              Text('￥ 30000'),
            ],
          ),
        ),
      ),
    );
  }
}
