import Foundation

public enum FlutterOnfidoFaceSteps : String, Codable {
    case video,
         photo
}

public class FlutterOnfidoFaceStep : Codable, Equatable {
    final let type: FlutterOnfidoFaceSteps
    
    final let intro: Bool
    
    init(type: FlutterOnfidoFaceSteps, intro: Bool = false) {
        self.type = type;
        self.intro = intro
    }
    
    public static func == (lhs: FlutterOnfidoFaceStep, rhs: FlutterOnfidoFaceStep) -> Bool {
        return lhs.type == rhs.type && lhs.intro == rhs.intro
    }
}
