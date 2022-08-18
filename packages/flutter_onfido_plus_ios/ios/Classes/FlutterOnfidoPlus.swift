import Foundation
import Flutter

class FlutterOnfidoPlus {
    
    func builder(data: Any) throws -> Either<FlutterError, Any> {
        if let arguments = data as? Map {
            do {
                let data = try FlutterOnfidoSettings.fromMap(data: arguments)
                
                
            } catch {
                NSLog("Failure to try from map the FlutterOnfidoSettings \(error)")
                return Either.Left(FlutterError(code: "settingsFromMap", message: "Failure on try parse to map the arguments parameters", details: error))
            }
        } else {
            return Either.Left(FlutterError(code: "argumentsIsNotMap", message: "The arguments parameters is not a Map type", details: nil))
        }
        
        return Either.Right(0)
    }
}
