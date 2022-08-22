import Foundation
import Onfido

typealias KeyedStep = KeyedDecodingContainer<FlutterOnfidoStep.CodingKeys>

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

class FlutterOnfidoStep : Codable, Equatable {
    final var type: FlutterOnfidoSteps
    
    final var country: Country?
    
    final var format: FlutterOnfidoDocumentFormat?
    
    public enum CodingKeys: String, CodingKey {
        case type, country, format
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(FlutterOnfidoSteps.self, forKey: .type)
        
    }
    
    init(container: KeyedStep) throws {
        type = try container.decode(FlutterOnfidoSteps.self, forKey: .type)
    }
    
    
    init(type: FlutterOnfidoSteps, country: Country? = nil, format: FlutterOnfidoDocumentFormat? = nil) {
        self.type = type
        self.country = country
        self.format = format
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
    
    static func == (lhs: FlutterOnfidoStep, rhs: FlutterOnfidoStep) -> Bool {
        return lhs.type == rhs.type && lhs.country == rhs.country && lhs.format == rhs.format
    }
    
    func builder(builder: Onfido.OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        fatalError()
    }
}

class FlutterOnfidoWithCountryStep : FlutterOnfidoStep {
    
    override init(type: FlutterOnfidoSteps, country: Country? = nil, format: FlutterOnfidoDocumentFormat? = nil) {
        super.init(type: type, country: country)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(Country.self, forKey: .country)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
        country = try container.decode(Country?.self, forKey: .country)
    }
}

class FlutterOnfidoWithCountryAndDocumentStep : FlutterOnfidoStep {
    
    override init(type: FlutterOnfidoSteps, country: Country? = nil, format: FlutterOnfidoDocumentFormat? = nil) {
        super.init(type: type, country: country, format: format)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(Country.self, forKey: .country)
        self.format = try container.decode(FlutterOnfidoDocumentFormat.self, forKey: .format)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
        country = try container.decode(Country.self, forKey: .country)
        format = try container.decode(FlutterOnfidoDocumentFormat.self, forKey: .format)
    }
    
    func buildFormat() -> Onfido.DocumentFormat {
        switch format {
        case .card:
            return DocumentFormat.card
        case .folded:
            return DocumentFormat.folded
        case .none:
            return DocumentFormat.card
        }
    }
}

class WelcomeStep : FlutterOnfidoStep {
    
    init() {
        super.init(type: .welcome)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withWelcomeStep()
    }
}

class PassportConfigurationStep : FlutterOnfidoStep {
    init() {
        super.init(type: .passport)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .passport(config: PassportConfiguration()))
    }
}

class ResidencePermitConfigurationStep : FlutterOnfidoWithCountryStep {
    init(country: Country) {
        super.init(type: .residencePermit, country: country)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .residencePermit(config: ResidencePermitConfiguration(country: country!.rawValue)), variant: .photo)
    }
}

class VisaConfigurationStep : FlutterOnfidoWithCountryStep {
    init(country: Country) {
        super.init(type: .visa, country: country)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .visa(config: VisaConfiguration(country: country!.rawValue)), variant: .photo)
    }
}

class WorkPermitConfigurationStep : FlutterOnfidoWithCountryStep {
    init(country: Country) {
        super.init(type: .workPermit, country: country)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .workPermit(config: WorkPermitConfiguration(country: country!.rawValue)), variant: .photo)
    }
}

class GenericConfigurationStep : FlutterOnfidoWithCountryStep {
    init(country: Country) {
        super.init(type: .generic, country: country)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .generic(config: GenericDocumentConfiguration(country: country!.rawValue)), variant: .photo)
    }
}

class NationalIdentityConfigurationStep : FlutterOnfidoWithCountryAndDocumentStep {
    init(country: Country, format: FlutterOnfidoDocumentFormat) {
        super.init(type: .nationalIdentity, country: country, format: format)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .nationalIdentityCard(config: NationalIdentityConfiguration(documentFormat: buildFormat(),country: country!.rawValue)), variant: .photo)
    }
}

class DrivingLicenseConfigurationStep : FlutterOnfidoWithCountryAndDocumentStep {
    init(country: Country, format: FlutterOnfidoDocumentFormat) {
        super.init(type: .drivingLicense, country: country, format: format)
    }
    
    override init(container: KeyedStep) throws {
        try super.init(container: container)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    override func builder(builder: OnfidoConfigBuilder) -> Onfido.OnfidoConfigBuilder {
        return builder.withDocumentStep(ofType: .drivingLicence(config: DrivingLicenceConfiguration(documentFormat: buildFormat(),country: country!.rawValue)), variant: .photo)
    }
}
