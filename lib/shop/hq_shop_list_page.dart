import 'package:flutter/material.dart';

class HqShopListPage extends StatefulWidget {
  const HqShopListPage({super.key});

  @override
  State<HqShopListPage> createState() => _HqShopListPageState();
}

class _HqShopListPageState extends State<HqShopListPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
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
        title: Text('商品 ${widget.index}'),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('商品 ${widget.index}'),
                  ),
                  body: Center(
                    child: Text('商品详情页 '),
                  ),
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
