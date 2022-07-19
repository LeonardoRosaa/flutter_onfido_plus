import Flutter
import UIKit

@available(iOS 10.0, *)
public class SwiftFlutterOnfidoPlusPlugin: NSObject, FlutterPlugin {
  private let onfidoSdk = OnfidoSdk()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_onfido", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterOnfidoPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual("start")){
      let config = call.arguments as! NSDictionary
      onfidoSdk.start(config, result: result)
    }
  }
}
