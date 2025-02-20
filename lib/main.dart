import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_main_page.dart';
import 'package:hq_flutter_desktop_stu/hq_navigationail_base.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // https://juejin.cn/post/7289072902887751717
  // 必须加上这一行。
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(1240, 800), // 设置最小窗口大小
    center: true, // 设置窗口居中
    title: "window_manager测试Demo", // 设置窗口标题
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.black,

        useMaterial3: true,
      ),

      // home: HqNavigationailBase(),
      home: HqMainPage(),
    );
  }
}
