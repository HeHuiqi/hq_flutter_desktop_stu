访问 Scaffold 组件的实例
第一种
```dart
Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    // 打开抽屉菜单
                    Scaffold.of(context).openDrawer();
                  },
                  child: Text('打开抽屉菜单2'),
                );
              })
```
第二种
```dart
final scaffoldState = GlobalKey<ScaffoldState>();

Scaffold(
  key: scaffoldState,
  appBar: AppBar(
    title: Text('Scaffold Demo'),
  ),
  body: Center(
    child: ElevatedButton(
      onPressed: () {
        // 打开抽屉菜单
        scaffoldState.currentState?.openDrawer();
      },
      child: Text('打开抽屉菜单'),
    ),
  )
)
```
第三种
```dart
final scaffoldState = GlobalKey<ScaffoldState>();
Scaffold(
  key: scaffoldState,
  appBar: AppBar(
    title: Text('Scaffold Demo'),
  ),
  body: Center(
    child: ElevatedButton(
      onPressed: () {
        // 查找父级最近的Scaffold对应的ScaffoldState对象
        ScaffoldState _state =
        context.findAncestorStateOfType<ScaffoldState>()!;
        // 打开抽屉菜单
         _state.openDrawer()
      }
    )
  )
)
```
所有相关字体icon

https://fonts.google.com/icons



单选开关Switch和复选框Checkbox，虽然它们都是继承自StatefulWidget，但它们本身不会保存当前选中状态，选中状态都是由父组件来管理的

 loading 动画
https://pub-web.flutter-io.cn/packages/flutter_spinkit


Expanded 只能作为 Flex 的孩子（否则会报错）,row column 都继承与flex


通过 LayoutBuilder，我们可以在布局过程中拿到父组件传递的约束信息，然后我们可以根据约束信息动态的构建不同的布局