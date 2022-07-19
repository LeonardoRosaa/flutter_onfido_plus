#import "FlutterOnfidoPlusPlugin.h"
#if __has_include(<flutter_onfido_plus/flutter_onfido_plus-Swift.h>)
#import <flutter_onfido_plus/flutter_onfido_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_onfido_plus-Swift.h"
#endif

@implementation FlutterOnfidoPlusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterOnfidoPlusPlugin registerWithRegistrar:registrar];
}
@end
