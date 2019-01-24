import 'package:flutter/material.dart';
import 'package:flutter_mi_stat/flutter_mi_stat.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    FlutterMiStat.init(
      androidAppId: '',
      androidAppKey: '',
      channel: 'com.xiaomi.fluttermistat',
      policy: FlutterMiStat.UPLOAD_POLICY_REAL_TIME,
      interval: 60000,
      enableURLStat: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('record'),
            onPressed: () => FlutterMiStat.recordCountEvent(
              category: 'test',
              key: 'test_event',
              params: {
                'key1': 'value1',
                'key2': 'value2',
              },
            ),
          ),
        ),
      ),
    );
  }
}
