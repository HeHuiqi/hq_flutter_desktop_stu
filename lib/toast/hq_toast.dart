import 'package:flutter/material.dart';

class HqToast {
  /*
      final GlobalKey<NavigatorState> navigatorStateKey = GlobalKey();
       var ctx = navigatorStateKey.currentState?.overlay;
       MaterialApp(
       // 设置全局唯一key，可以中用 navigatorStateKey.currentState.push()来做路由跳转了
        navigatorKey: navigatorStateKey,
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                HqToast.showToastContext(ctx, "Hello World");
              },
              child: const Text('Show Toast'),
            ),
          ),
        ),
      );
   */
  static void showToastWithOverlayState(OverlayState? overlay, String message,
      [double top = 80]) {
    if (overlay == null) {
      return;
    }
    final overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: top,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(204),
              borderRadius: BorderRadius.circular(10),
            ),
            /*
            https://www.cnblogs.com/jisa/p/13840994.html
            不使用Material相关的组件包裹Text组件，会出现Text自动带黄色下划线的情况，
            https://blog.csdn.net/Steve_XiaoHai/article/details/135870029
             */
            child: Material(
              color: Colors.transparent,
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ),
      );
    });

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 1), () {
      overlayEntry.remove();
    });
  }

  static void showToastContext(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    showToastWithOverlayState(overlay, message);
  }
}
