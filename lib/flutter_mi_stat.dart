import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterMiStat {
  static const MethodChannel _channel = const MethodChannel('flutter_mi_stat');
  static const int UPLOAD_POLICY_REAL_TIME = 0;
  static const int UPLOAD_POLICY_WIFI_ONLY = 1;
  static const int UPLOAD_POLICY_BATCH = 2;
  static const int UPLOAD_POLICY_WHILE_INITIALIZE = 3;
  static const int UPLOAD_POLICY_INTERVAL = 4;
  static const int UPLOAD_POLICY_DEVELOPMENT = 5;

  static void init({
    @required String androidAppId,
    @required String androidAppKey,
    String channel = '',
    int policy = UPLOAD_POLICY_REAL_TIME,
    int interval = 0,
    bool enableURLStat = false,
  }) async {
    final Map<String, dynamic> params = <String, dynamic>{
      'androidAppId': androidAppId,
      'androidAppKey': androidAppKey,
      'channel': channel,
      'policy': policy,
      'interval': interval,
      'enableURLStat': enableURLStat,
    };
    await _channel.invokeMethod('init', params);
  }

  static void recordCountEvent({
    @required String key,
    String category,
    Map<String, String> params,
  }) async {
    final Map<String, dynamic> callParams = <String, dynamic>{
      'key': key,
      'category': category,
      'params': params,
    };
    _channel.invokeMethod('recordCountEvent', callParams);
  }
}
