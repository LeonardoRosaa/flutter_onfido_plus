import Foundation
import Onfido

enum FlutterOnfidoFaceSteps : String, Codable {
    case video,
         photo
}

class FlutterOnfidoFaceStep : Codable, Equatable {
    final let type: FlutterOnfidoFaceSteps
    
    final let intro: Bool
    
    init(type: FlutterOnfidoFaceSteps, intro: Bool = false) {
        self.type = type;
        self.intro = intro
    }
    
    static func == (lhs: FlutterOnfidoFaceStep, rhs: FlutterOnfidoFaceStep) -> Bool {
        return lhs.type == rhs.type && lhs.intro == rhs.intro
    }
    
    func builder(builder: Onfido.OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        switch type {
        case .video:
            return builder.withFaceStep(ofVariant: .video(withConfiguration: VideoStepConfiguration(showIntroVideo: intro, manualLivenessCapture: false)))
        case .photo:
            return builder.withFaceStep(ofVariant: .photo(withConfiguration: PhotoStepConfiguration(showSelfieIntroScreen: intro)))
        }
        
    }
}
