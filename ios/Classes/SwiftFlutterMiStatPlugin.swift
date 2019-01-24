import Flutter
import UIKit

public class SwiftFlutterMiStatPlugin: NSObject, FlutterPlugin, MiAAnalyticsNetworkDelegate {
  var TAG = "SwiftFlutterMiStatPlugin:";
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_mi_stat", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterMiStatPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "init") {
      initStat(call: call, result: result)
    } else if (call.method == "recordCountEvent") {
      recordCountEvent(call: call, result: result)
    }
  }

  private func initStat(call: FlutterMethodCall, result: @escaping FlutterResult) {
      let args = call.arguments as! [String: Any]
      let channel = args["channel"] as! String
      let policy = transferPolicy(policy: args["policy"] as! Int32)
      let interval = args["interval"] as! Int32
      let enableURLStat = args["enableURLStat"] as! Bool
      var log = TAG + "initStat:"
      log += " channel = " + channel
      log += ", policy = " + policy.rawValue.description
      log += ", interval = " + interval.description
      log += ", enableURLStat = " + enableURLStat.description
      NSLog(log)
      MiStatSDK.registerMiStat(channel)
      MiStatSDK.setUploadPolicy(policy, interval: interval)
      MiStatNetwork.enableAnalyticsNetwork(enableURLStat, delegate: self)
      result("success")
    }

    private func recordCountEvent(call: FlutterMethodCall, result: @escaping FlutterResult) {
      let args = call.arguments as! [String: Any]
      let key = args["key"] as! String
      let category = args["category"] as! String
      let params = args["params"] as! [String: Any]
      var log = TAG + "recordCountEvent:"
      log += " key = " + key
      log += ", category = " + category
      log += ", params = " + params.description
      NSLog(log)
      MiStatSDK.recordCountEvent(category, key: key, dictionary: params)
      result("success")
    }

    private func transferPolicy(policy: Int32) -> UPLOAD_POLICY {
      if (policy == 0) {
          return UPLOAD_POLICY_TYPE_REALTIME
      } else if (policy == 1) {
          return UPLOAD_POLICY_TYPE_WIFI_ONLY
      } else if (policy == 4) {
          return UPLOAD_POLICY_TYPE_INTERVAL
      } else if (policy == 5) {
          return UPLOAD_POLICY_TYPE_DEVELOPMENT
      }
      return UPLOAD_POLICY_TYPE_LAUNCH;
    }

    func mistatAnalyticsNetwork(_ url: String!) -> String! {
      return url;
    }
}
