# flutter_mi_stat

Android/iOS平台上集成小米统计

## iOS

* info.plist中添加：
```xml
<key>MiSDKAppID</key>
<string>your iOS app id</string>
<key>MiSDKAppKey</key>
<string>your iOS app key</string>
```
## Flutter

* 初始化：
```dart
FlutterMiStat.init(
  androidAppId: ANDROID_APP_ID,
  androidAppKey: ANDROID_APP_KEY,
  channel: CHANNEL,
  policy: FlutterMiStat.UPLOAD_POLICY_REAL_TIME,
  enableURLStat: true,
);
```
* 打点：
```dart
FlutterMiStat.recordCountEvent(
  category: category,
  key: key,
  params: params,
);
```