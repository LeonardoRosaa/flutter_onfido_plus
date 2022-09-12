import Foundation
import Flutter
import Onfido

typealias OnfidoConfigBuild = () -> Onfido.OnfidoConfigBuilder

class FlutterOnfidoPlus {
        
    final let onfidoConfigBuild: OnfidoConfigBuild
    
    init(onfidoConfigBuild: @escaping OnfidoConfigBuild) {
        self.onfidoConfigBuild = onfidoConfigBuild
    }
    
    func builder(data: Any, result: @escaping FlutterResult) -> Void {
        
        let config = parseData(data: data)
        
        switch config {
        case .Left(let error):
            result(error)
        case .Right(let settings):
            let onfidoConfig = buildTheOnfidoConfig(settings: settings)
            
            switch onfidoConfig {
            case .Left(let error):
                result(error)
            case .Right(let onfidoConfig):
                let flow = executeFlow(onfidoConfig: onfidoConfig, result: result)
                
                switch flow {
                case .Left(let error):
                    result(error)
                case .Right(let controller):
                    UIApplication.shared.windows.first?.rootViewController?.present(controller, animated: true)
                }
            }
        }
    }
    
    func parseData(data: Any) -> Either<FlutterError, FlutterOnfidoSettings> {
        if let arguments = data as? Map {
            do {
                let data = try FlutterOnfidoSettings.fromMap(data: arguments)
                
                return Either.Right(data)
            } catch {
                let exception = FromMapException(details: error.localizedDescription)
                return Either.Left(exception.error)
            }
        } else {
            let exception = NotMapException(details: nil)
            return Either.Left(exception.error)
        }
    }
    
    /// Create Onfido configurations according to settings in parameters.
    /// This includes setting up the steps, SDK token, and other stuff necessary to Onfido work.
    func buildTheOnfidoConfig(settings: FlutterOnfidoSettings) -> Either<FlutterError, OnfidoConfig> {
        let onfidoConfigBuilder = OnfidoConfig.builder()
        
        let madeStepsBuilder = makeSteps(settings: settings, onfidoConfigBuilder: onfidoConfigBuilder)
        
        let executedConfigBuilder = executeConfigBuilder(onfidoConfigBuilder: madeStepsBuilder)
        
        switch executedConfigBuilder {
        case .Left(let error):
            return Either.Left(error)
        case .Right(let onfidoConfig):
            return Either.Right(onfidoConfig)
        }
    }
    
    func makeSteps(settings: FlutterOnfidoSettings, onfidoConfigBuilder: OnfidoConfigBuilder) -> OnfidoConfigBuilder  {
        
        onfidoConfigBuilder.withSDKToken(settings.token)
        
        for step in settings.steps {
            NSLog("making the step \(step.type)")
            _ = step.builder(builder: onfidoConfigBuilder)
        }
        
        if settings.appearence != nil {
            onfidoConfigBuilder.withAppearance(settings.appearence!.appearence)
        }
        
        _ = settings.faceStep?.builder(builder: onfidoConfigBuilder)
        
        return onfidoConfigBuilder
    }
    
    func executeConfigBuilder(onfidoConfigBuilder: OnfidoConfigBuilder) -> Either<FlutterError, OnfidoConfig> {
        do {
            let onfidoConfig = try onfidoConfigBuilder.build()
            
            return Either.Right(onfidoConfig)
        } catch (let error) {
            let exception = OnfidoConfigurationException(details: error.localizedDescription)
            return Either.Left(exception.error)
        }
    }
    
    func executeFlow(onfidoConfig: OnfidoConfig, result: @escaping FlutterResult) -> Either<FlutterError, UIViewController> {
        do {
            let responseHandler: (OnfidoResponse) -> Void = { response in
                switch response {
                case .error(let error):
                    let exception = ResponseHandlerException(details: error.localizedDescription)
                    result(exception.error)
                case .success(let results):
                    result(results)
                case .cancel(let reason):
                    let exception = CanceledException(details: reason.rawValue.description)
                    result(exception.error)
                @unknown default:
                    result(ResponseHandlerException(details: nil))
                }
            }
            let onfidoFlow = OnfidoFlow(withConfiguration: onfidoConfig).with(responseHandler:responseHandler)
            
            let controller = try onfidoFlow.run()
            
            return Either.Right(controller)
        } catch (let error) {
            let exception = RunningFlowException(details: error.localizedDescription)
            return Either.Left(exception.error)
        }
    }
}
