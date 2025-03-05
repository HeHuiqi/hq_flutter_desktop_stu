import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/settings/hq_setting_page.dart';

class HqAdminPage extends StatefulWidget {
  const HqAdminPage({super.key});

  @override
  State<HqAdminPage> createState() => _HqAdminPageState();
}

class _HqAdminPageState extends State<HqAdminPage> {
  ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('HQ Admin Page'),
      ),
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return HqSettingPage();
                  }));
                },
                child: const Text('主题 1')),
            ElevatedButton(onPressed: () {}, child: const Text('主题 2')),
          ],
        ),
      ),
    );
  }
}
