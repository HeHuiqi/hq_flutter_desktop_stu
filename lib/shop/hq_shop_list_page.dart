import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/shop/hq_shop_detail_page.dart';
import 'package:hq_flutter_desktop_stu/status/hq_shop_cart_notifier.dart';
import 'package:hq_flutter_desktop_stu/widgets/hq_button.dart';
import 'package:provider/provider.dart';

class HqShopListPage extends StatefulWidget {
  const HqShopListPage({super.key});

  @override
  State<HqShopListPage> createState() => _HqShopListPageState();
}

class _HqShopListPageState extends State<HqShopListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    //通过Navigator组件包裹可以实现子路由跳转
    // https://juejin.cn/post/7168662360230461454
    return Navigator(
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) {
            return Scaffold(
              body: SizedBox(
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
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) {
              return HqShopDetailPage();
            }),
          );
        },
        child: Container(
            color: Colors.black,
            padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 15),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/shop_item.png',
                      height: 240, fit: BoxFit.fitHeight),
                ),
                SizedBox(height: 5),
                Text('miniFTD 2025 ${widget.index}',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                Text('￥30000',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(height: 10),
                HqButton(
                  onPressed: () {
                    print('加入购物车');
                    //获取提供者
                    HqShopCartNotifier shopCart =
                        context.read<HqShopCartNotifier>();
                    //改变值，触发通知
                    shopCart.addShopCountOne();
                  },
                  child: Text('加入购物车',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            )),
      ),
    );
  }
}
