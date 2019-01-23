#import "FlutterMiStatPlugin.h"
#import <flutter_mi_stat/flutter_mi_stat-Swift.h>

@implementation FlutterMiStatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMiStatPlugin registerWithRegistrar:registrar];
}
@end
