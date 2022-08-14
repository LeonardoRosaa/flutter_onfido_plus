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
            let data = try! FlutterOnfidoSettings.fromMap(data: arguments)
            print(data.token)
            print(data.steps)
            
            for i in data.steps {
                print("Country \(i.country)")
                print("Format \(i.format)")
                
            }
        } else {
            NSLog("The arguments is not Map typed")
        }
        
        result("iOS " + UIDevice.current.systemVersion)
    }
}
