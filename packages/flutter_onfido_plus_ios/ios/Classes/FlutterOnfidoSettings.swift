import Foundation

typealias Map = Dictionary<String, Any?>

class FlutterOnfidoSettings : Codable {
    
    final let token: String
    
    final let steps: [FlutterOnfidoStep]
    
    final let faceStep: FlutterOnfidoFaceStep?
    
    private enum CodingKeys : String, CodingKey {
        case token, steps, faceStep
    }
    
    static func fromMap(data: Map) throws -> FlutterOnfidoSettings {
        let decoder = JSONDecoder()
        let json = try JSONSerialization.data(withJSONObject: data)
        
        return try decoder.decode(FlutterOnfidoSettings.self, from: json)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var steps = try container.nestedUnkeyedContainer(forKey: CodingKeys.steps)
        
        self.token = try container.decode(String.self, forKey: .token)
        self.steps = try FlutterOnfidoStep.build(nested: &steps)
        self.faceStep = try container.decode(FlutterOnfidoFaceStep?.self, forKey: .faceStep)
    }
}
