import Foundation

public typealias Map = Dictionary<String, Any?>

class FlutterOnfidoSettings : Codable, Equatable {
   
    final let token: String
    
    final let steps: [FlutterOnfidoStep]
    
    final let faceStep: FlutterOnfidoFaceStep?
    
    private enum CodingKeys : String, CodingKey {
        case token, steps, faceStep
    }
    
    static public func fromMap(data: Map) throws -> FlutterOnfidoSettings {
        let decoder = JSONDecoder()
        let json = try JSONSerialization.data(withJSONObject: data)
        
        return try decoder.decode(FlutterOnfidoSettings.self, from: json)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var steps = try container.nestedUnkeyedContainer(forKey: CodingKeys.steps)
        
        self.token = try container.decode(String.self, forKey: .token)
        self.steps = try FlutterOnfidoStep.build(nested: &steps)
        self.faceStep = try container.decodeIfPresent(FlutterOnfidoFaceStep.self, forKey: .faceStep)
    }
    
    init(token: String, steps: [FlutterOnfidoStep], faceStep: FlutterOnfidoFaceStep? = nil) {
        self.token = token
        self.steps = steps
        self.faceStep = faceStep
    }
    
    static func == (lhs: FlutterOnfidoSettings, rhs: FlutterOnfidoSettings) -> Bool {
        return lhs.token == rhs.token && lhs.steps == rhs.steps && lhs.faceStep == rhs.faceStep
    }
}
