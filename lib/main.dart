import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/admin_app/hq_admin_page.dart';
import 'package:hq_flutter_desktop_stu/demos/hq_demo1_page.dart';
import 'package:hq_flutter_desktop_stu/demos/hq_drop_down_test.dart';
import 'package:hq_flutter_desktop_stu/hq_%20sidebarx_stu_page.dart';
import 'package:hq_flutter_desktop_stu/hq_demo_page.dart';
import 'package:hq_flutter_desktop_stu/hq_left_nav_menu.dart';
import 'package:hq_flutter_desktop_stu/hq_main_page.dart';
import 'package:hq_flutter_desktop_stu/hq_navigationail_base.dart';
import 'package:hq_flutter_desktop_stu/hq_theme.dart';
import 'package:hq_flutter_desktop_stu/keys/hq_global_key.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_app_menu_page.dart';
import 'package:hq_flutter_desktop_stu/menu/hq_app_menu_page.dart';
import 'package:hq_flutter_desktop_stu/menu_bar_examp/hq_menu_bar_examp_page.dart';
import 'package:hq_flutter_desktop_stu/settings/hq_setting_notifier.dart';
import 'package:hq_flutter_desktop_stu/settings/hq_setting_page.dart';
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
      // setWindowSize();
    }
  }
  MultiProvider provider = MultiProvider(
    providers: [
      ChangeNotifierProvider<HqShopCartNotifier>(create: (_) {
        return HqShopCartNotifier();
      }),
      ChangeNotifierProvider<HqSettingNotifier>(create: (_) {
        return HqSettingNotifier();
      }),
      ChangeNotifierProvider<AppInfoProvider>(create: (_) {
        return AppInfoProvider();
      })
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
    /*
    Consumer Consumer2 Consumer3 Consumer4 Consumer5 Consumer6
    这5个widget都是用来监听Provider中的数据变化的，但是它们的区别在于：
    Consumer 是监听单个Provider中的数据变化的，它的泛型参数是Provider中的数据类型。
    Consumer2 是监听两个Provider中的数据变化的，它的泛型参数是两个Provider中的数据类型。
    Consumer3 是监听三个Provider中的数据变化的，它的泛型参数是三个Provider中的数据类型。
    Consumer4 是监听四个Provider中的数据变化的，它的泛型参数是四个Provider中的数据类型。
    Consumer5 是监听五个Provider中的数据变化的，它的泛型参数是五个Provider中的数据类型。
    Consumer6 是监听六个Provider中的数据变化的，它的泛型参数是六个Provider中的数据类型。
    它们的使用方法都是一样的，都是通过builder属性来构建UI，但是它们的泛型参数不同，
    所以它们的builder属性的参数也不同。

    */
    return Consumer2(builder: (context, HqSettingNotifier settingNotifier,
        AppInfoProvider appInfo, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        // 设置全局唯一key，可以中用 navigatorStateKey.currentState.push()来做路由跳转了
        navigatorKey: navigatorStateKey,
        theme: HqTheme.lightTheme(
            primaryColor: HqThemeColorMap[appInfo.themeColor]),
        // theme: ThemeData(
        //   useMaterial3: true,
        //   primaryColor: HqThemeColorMap[appInfo.themeColor],
        // ),

        darkTheme: HqTheme.darkTheme(),

        themeMode: settingNotifier.themeMode,
        // home: HqNavigationailBase(),
        // home: HqSiderBarPage(),
        // home: HqDemoPage(),
        // home: HqSettingPage(),
        // home: HqAdminPage(),
        // home: HqAppMenuPage(),
        // home: HqAppMenuPage(),
        // home: HqDemo1Page(),
        home: HqMainPage(),
        // home: HqDropDownCustomPage(),
      );
    });

    // return Consumer<HqSettingNotifier>(
    //     builder: (context, settingNotifier, child) {
    //   return MaterialApp(
    //     title: 'Flutter Demo',
    //     // 设置全局唯一key，可以中用 navigatorStateKey.currentState.push()来做路由跳转了
    //     navigatorKey: navigatorStateKey,
    //     theme: HqTheme.lightTheme(),
    //     darkTheme: HqTheme.darkTheme(),
    //     //      //https://medium.com/@amazing_gs/complete-flutter-guide-how-to-implement-dark-mode-dynamic-theming-and-theme-switching-ddabaef48d5a
    //     themeMode: settingNotifier.themeMode,
    //     // home: HqNavigationailBase(),
    //     // home: HqSiderBarPage(),
    //     // home: HqDemoPage(),
    //     home: HqSettingPage(),
    //     // home: HqMainPage(),
    //   );
    // });

    ///
    ///
  }
}
