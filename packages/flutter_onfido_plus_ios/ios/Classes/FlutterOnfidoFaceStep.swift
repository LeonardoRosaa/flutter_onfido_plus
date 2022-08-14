import Foundation

enum FlutterOnfidoFaceSteps : String, Codable {
  case video,
  photo
}

class FlutterOnfidoFaceStep : Codable {
    final let type: FlutterOnfidoFaceSteps
    
    final let intro: Bool
}
