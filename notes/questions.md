

macOS 请求网络时配置网络权限
https://blog.csdn.net/long_tai_peng/article/details/129286661

DebugProfile.entitlements
```xml
    <key>com.apple.security.network.server</key>
    <true/>
    <key>com.apple.security.network.client</key>
    <true/> 
```
Release.entitlements
```xml
    <key>com.apple.security.network.server</key>
    <true/>
    <key>com.apple.security.network.client</key>
    <true/> 
```

info.plist 允许任意网络请求

```xml
    <key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
```
Flutter 使用ListView 。滚动时 AppBar 改变颜色问题
https://blog.csdn.net/q515656712/article/details/135059936
全局设置
```
   MaterialApp(
    theme: ThemeData(
        appBarTheme: AppBarTheme(scrolledUnderElevation: 0.0)
    )
)
```
局部设置
```dart
AppBar(
    scrolledUnderElevation: 0.0
)
```