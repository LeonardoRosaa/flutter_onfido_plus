import Foundation

enum FlutterOnfidoSteps : String, Codable {
    case welcome,
         passport,
         drivingLicense,
         nationalIdentity,
         residencePermit,
         visa,
         workPermit,
         generic
}

class FlutterOnfidoStep : Codable {
    public var type: FlutterOnfidoSteps
    
    public var country: Country?
    
    public var format: FlutterOnfidoDocumentFormat?
    
    public enum CodingKeys: String, CodingKey {
        case type, country, format
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(FlutterOnfidoSteps.self, forKey: .type)
        
    }
    
    init(container: KeyedDecodingContainer<CodingKeys>) throws {
        type = try container.decode(FlutterOnfidoSteps.self, forKey: .type)
    }
    
    static func build(nested: inout UnkeyedDecodingContainer) throws -> [FlutterOnfidoStep] {
        var steps: [FlutterOnfidoStep] = []
        
        while !nested.isAtEnd {
            let container = try nested.nestedContainer(keyedBy: CodingKeys.self)
            let type = try container.decode(FlutterOnfidoSteps.self, forKey: CodingKeys.type)
            
            switch type {
            case .welcome:
                steps.append(try WelcomeStep(container: container))
            case .passport:
                steps.append(try PassportConfigurationStep(container: container))
            case .residencePermit:
                steps.append(try ResidencePermitConfigurationStep(container: container))
            case .visa:
                steps.append(try VisaConfigurationStep(container: container))
            case .workPermit:
                steps.append(try WorkPermitConfigurationStep(container: container))
            case .generic:
                steps.append(try GenericConfigurationStep(container: container))
            case .drivingLicense:
                steps.append(try DrivingLicenseConfigurationStep(container: container))
            case .nationalIdentity:
                steps.append(try NationalIdentityConfigurationStep(container: container))
            }
        }
        
        return steps
    }
}

class FlutterOnfidoWithCountryStep : FlutterOnfidoStep {
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(Country.self, forKey: .country)
    }
    
    override init(container: KeyedDecodingContainer<FlutterOnfidoStep.CodingKeys>) throws {
        try super.init(container: container)
        country = try container.decode(Country?.self, forKey: .country)
    }
}

class FlutterOnfidoWithCountryAndDocumentStep : FlutterOnfidoStep {
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(Country.self, forKey: .country)
        self.format = try container.decode(FlutterOnfidoDocumentFormat.self, forKey: .format)
    }
    
    override init(container: KeyedDecodingContainer<FlutterOnfidoStep.CodingKeys>) throws {
        try super.init(container: container)
        country = try container.decode(Country.self, forKey: .country)
        format = try container.decode(FlutterOnfidoDocumentFormat.self, forKey: .format)
    }
}

class WelcomeStep : FlutterOnfidoStep {}

class PassportConfigurationStep : FlutterOnfidoStep {}

class ResidencePermitConfigurationStep : FlutterOnfidoWithCountryStep {}

class VisaConfigurationStep : FlutterOnfidoWithCountryStep {}

class WorkPermitConfigurationStep : FlutterOnfidoWithCountryStep {}

class GenericConfigurationStep : FlutterOnfidoWithCountryStep {}

class NationalIdentityConfigurationStep : FlutterOnfidoWithCountryAndDocumentStep {}

class DrivingLicenseConfigurationStep : FlutterOnfidoWithCountryAndDocumentStep {}
