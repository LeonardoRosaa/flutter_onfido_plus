import Foundation

class AppException : Error {
    
    final let code: String
    
    final let message: String
    
    final let details: String?
    
    var error: FlutterError {
        return FlutterError(code: code, message: message, details: details)
    }
    
    init(code: String, message: String, details: String?) {
        self.code = code
        self.message = message
        self.details = details
    }
}

class OnfidoConfigurationException : AppException {
    
    init(details: String?) {
        super.init(code: "onfidoConfigurationBuilderException", message: "Occurs an exception on trying execute onfido configuration builder", details: details)
    }
}

class FromMapException : AppException {
    init(details: String?) {
        super.init(code: "fromMapException", message: "Occurs an exception to parse map to required data", details: details)
    }
}

class NotMapException : AppException {
    init(details: String?) {
        super.init(code: "notMapException", message: "The arguments parameters is not a map type", details: details)
    }
}

class ResponseHandlerException : AppException {
    init(details: String?) {
        super.init(code: "responseHandlerException", message: "Occurs an exception into the user flow", details: details)
    }
}

class CanceledException : AppException {
    init(details: String?) {
        super.init(code: "canceledException", message: "The onfido flow is canceled", details: details)
    }
}

class RunningFlowException : AppException {
    init(details: String?) {
        super.init(code: "runningFlowException", message: "Occurs an exception on trying running the flow", details: details)
    }
}
