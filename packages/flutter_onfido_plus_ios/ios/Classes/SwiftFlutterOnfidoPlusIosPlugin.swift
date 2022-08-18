import Flutter
import UIKit


public class SwiftFlutterOnfidoPlusIosPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_onfido_plus_ios", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterOnfidoPlusIosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let arguments = call.arguments as? Map {
            do {
                let data = try FlutterOnfidoSettings.fromMap(data: arguments)
                
                
            } catch {
                NSLog("Failure to try from map the FlutterOnfidoSettings \(error)")
                result(FlutterError(code: "settingsFromMap", message: "Failure on try parse to map the arguments parameters", details: error))
            }
        } else {
            result(FlutterError(code: "argumentsIsNotMap", message: "The arguments parameters is not a Map type", details: nil))
        }
    }
}
