import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_%20sidebarx_stu_page.dart';
import 'package:hq_flutter_desktop_stu/hq_demo_page.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_main_page.dart';
import 'package:hq_flutter_desktop_stu/hq_navigationail_base.dart';
import 'package:hq_flutter_desktop_stu/keys/hq_global_key.dart';
import 'package:hq_flutter_desktop_stu/status/hq_shop_cart_notifier.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void setWindowSize() async {
  // https://juejin.cn/post/7289072902887751717
  // 必须加上这一行。
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(1192, 860), // 设置最小窗口大小
    center: true, // 设置窗口居中
    title: "Flutter Destop", // 设置窗口标题
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

void main() async {
  //   // 确保 Flutter 框架初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isMacOS) {
      setWindowSize();
    }
  }
  MultiProvider provider = MultiProvider(
    providers: [
      ChangeNotifierProvider<HqShopCartNotifier>(create: (_) {
        return HqShopCartNotifier();
      }),
    ],
    child: const MyApp(),
  );
  runApp(provider);

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 设置全局唯一key，可以中用 navigatorStateKey.currentState.push()来做路由跳转了
      navigatorKey: navigatorStateKey,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.black,
        //
        appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
        useMaterial3: true,
      ),

      // home: HqNavigationailBase(),
      home: HqMainPage(),
      // home: HqSiderBarPage(),
      // home: HqDemoPage(),
    );
  }
}
