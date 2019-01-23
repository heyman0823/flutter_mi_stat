package com.xiaomi.fluttermistat

import android.content.Context
import android.util.Log
import com.xiaomi.mistatistic.sdk.MiStatInterface
import com.xiaomi.mistatistic.sdk.URLStatsRecorder
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterMiStatPlugin(private val context: Context) : MethodCallHandler {
  companion object {
    private const val TAG = "FlutterMiStatPlugin"

    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_mi_stat")
      channel.setMethodCallHandler(FlutterMiStatPlugin(registrar.context()))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when {
      call.method == "init" -> init(call, result)
      call.method == "recordCountEvent" -> recordCountEvent(call, result)
      else -> result.notImplemented()
    }
  }

  private fun init(call: MethodCall, result: Result) {
    val appId = call.argument<String>("androidAppId")
    val appKey = call.argument<String>("androidAppKey")
    val channel = call.argument<String>("channel")
    val policy = call.argument<Int>("policy")!!
    val interval = call.argument<Int>("interval")?.toLong()!!
    var enableURLStat = call.argument<Boolean>("enableURLStat")!!
    Log.d(TAG, "init: appId = $appId, appKey = $appKey, channel = $channel" +
            ", policy = $policy, interval = $interval, enableURLStat = $enableURLStat")
    MiStatInterface.initialize(context, appId, appKey, channel)
    MiStatInterface.setUploadPolicy(policy, interval)
    if (enableURLStat) {
      URLStatsRecorder.enableAutoRecord()
    }
    result.success("success")
  }

  private fun recordCountEvent(call: MethodCall, result: Result) {
    val category = call.argument<String>("category")
    val key = call.argument<String>("key")
    val params = call.argument<Map<String, String>>("params")
    Log.d(TAG, "recordCountEvent: category = $category, key = $key, params = $params")
    MiStatInterface.recordCountEvent(category, key, params)
    result.success("success")
  }
}
