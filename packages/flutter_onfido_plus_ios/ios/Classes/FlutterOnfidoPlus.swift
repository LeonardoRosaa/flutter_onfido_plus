import Foundation
import Flutter
import Onfido

class FlutterOnfidoPlus {
    
    func builder(data: Any, result: @escaping FlutterResult) -> Void {
        
        let config = parseData(data: data)
        
        switch config {
        case .Left(let error):
            result(error)
        case .Right(let settings):
            let onfidoConfig = makeBuilder(settings: settings)
            
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
                NSLog("Failure to try from map the FlutterOnfidoSettings \(error)")
                return Either.Left(FlutterError(code: "settingsFromMapError", message: "Failure on try parse to map the arguments parameters", details: error))
            }
        } else {
            return Either.Left(FlutterError(code: "argumentsIsNotMapError", message: "The arguments parameters is not a Map type", details: nil))
        }
    }
    
    func makeBuilder(settings: FlutterOnfidoSettings) -> Either<FlutterError, OnfidoConfig> {
        let onfidoConfigBuilder = OnfidoConfig.builder()
        
        let madeSteps = makeSteps(settings: settings, onfidoConfigBuilder: onfidoConfigBuilder)
        
        switch madeSteps {
        case .Left(let error):
            return Either.Left(error)
        case .Right(let onfidoConfigBuilder):
            let executedConfigBuilder = executeConfigBuilder(onfidoConfigBuilder: onfidoConfigBuilder)
            
            switch executedConfigBuilder {
            case .Left(let error):
                return Either.Left(error)
            case .Right(let onfidoConfig):
                return Either.Right(onfidoConfig)
            }
        }
    }
    
    func makeSteps(settings: FlutterOnfidoSettings, onfidoConfigBuilder: OnfidoConfigBuilder) -> Either<FlutterError, OnfidoConfigBuilder>  {
        
        onfidoConfigBuilder.withSDKToken(settings.token)
        
        for step in settings.steps {
            NSLog("making the step \(step.type)")
            _ = step.builder(builder: onfidoConfigBuilder)
        }
        
        _ = settings.faceStep?.builder(builder: onfidoConfigBuilder)
        
        return Either.Right(onfidoConfigBuilder)
    }
    
    func executeConfigBuilder(onfidoConfigBuilder: OnfidoConfigBuilder) -> Either<FlutterError, OnfidoConfig> {
        do {
            let onfidoConfig = try onfidoConfigBuilder.build()
            
            return Either.Right(onfidoConfig)
        } catch (let error) {
            NSLog("Failure on try execute builder configurations")
            return Either.Left(FlutterError(code: "onfidoConfigBuilderError", message: "Failure on try execute builder configurations", details: error))
        }
    }
    
    func executeFlow(onfidoConfig: OnfidoConfig, result: @escaping FlutterResult) -> Either<FlutterError, UIViewController> {
        do {
            let responseHandler: (OnfidoResponse) -> Void = { response in
                switch response {
                case .error(let error):
                    result(FlutterError(code: "responseOnfidoFlowError", message: "Failure on try execute the Onfido Flow", details: error))
                case .success(let results):
                    result(results)
                case .cancel(let reason):
                    result(FlutterError(code: "cancelOnfidoFlowError", message: "Cancelled Onfido flow", details: reason))
                default:
                    result(FlutterError(code: "responseOnfidoFlowError", message: "Failure on try execute the Onfido Flow", details: nil))
                }
            }
            let onfidoFlow = OnfidoFlow(withConfiguration: onfidoConfig).with(responseHandler:responseHandler)
            
            let controller = try onfidoFlow.run()
            
            return Either.Right(controller)
        } catch (let error) {
            NSLog("Failure on try execute the Onfido Flow")
            return Either.Left(FlutterError(code: "executeOnfidoFlowError", message: "Failure on try execute the Onfido Flow", details: error))
        }
    }
}
