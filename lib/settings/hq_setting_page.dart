import 'package:flutter/material.dart';
import 'package:hq_flutter_desktop_stu/hq_theme.dart';
import 'package:hq_flutter_desktop_stu/settings/hq_setting_notifier.dart';
import 'package:provider/provider.dart';

class HqSettingPage extends StatefulWidget {
  const HqSettingPage({super.key});

  @override
  State<HqSettingPage> createState() => _HqSettingPageState();
}

class _HqSettingPageState extends State<HqSettingPage> {
  ThemeMode themeMode = ThemeMode.system;
  String _colorKey = 'red';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('HQ Setting Page'),
      ),
      body: Center(
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  HqSettingNotifier notifier =
                      context.read<HqSettingNotifier>();
                  notifier.setThemeMode(ThemeMode.light);
                },
                child: const Text('主题 light')),
            ElevatedButton(
                onPressed: () {
                  HqSettingNotifier notifier =
                      context.read<HqSettingNotifier>();
                  notifier.setThemeMode(ThemeMode.dark);
                },
                child: const Text('主题 dart')),
            ExpansionTile(
              leading: Icon(Icons.color_lens),
              title: Text('颜色主题'),
              initiallyExpanded: false,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: HqThemeColorMap.keys.map((key) {
                      Color? value = HqThemeColorMap[key];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _colorKey = key;
                          });
                          //SpUtil.putString('key_theme_color', key);
                          // Provider.of<AppInfoProvider>(context, listen: false)
                          //     .setTheme(key);
                          AppInfoProvider appInfoProvider =
                              context.read<AppInfoProvider>();
                          appInfoProvider.setTheme(key);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          color: value,
                          child: _colorKey == key
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
