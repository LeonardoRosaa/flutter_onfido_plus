import Flutter
import UIKit

public class SwiftFlutterOnfidoPlusIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_onfido_plus_ios", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterOnfidoPlusIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
