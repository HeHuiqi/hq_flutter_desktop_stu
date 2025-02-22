import 'package:flutter/material.dart';

class HqShopCartNotifier with ChangeNotifier {
  int _shopCount = 0; //默认没有在App内设置
  int get shopCount => _shopCount;
  void addShopCountOne() {
    _shopCount++;
    notifyListeners();
  }

  void addShopCount(int count) {
    print('_shopCount:$_shopCount,count:$count');
    _shopCount += count;
    notifyListeners();
  }
}
