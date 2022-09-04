//
//  FlutterOnfidoPlus.swift
//  RunnerTests
//
//  Created by Leonardo Rosa on 29/08/22.
//

import XCTest
@testable import flutter_onfido_plus_ios
@testable import Onfido

class MockBuilder : OnfidoConfigBuilder {
    
}

class FlutterOnfidoPlusTest: XCTestCase {
    
    func testExample() throws {
        var data = [String : Any?]()
        
        data["token"] = "token"
        data["steps"] = [
            [
                "type": "welcome"
            ],
            [
                "type": "workPermit",
                "country": "afg"
            ],
            [
                "type": "drivingLicense",
                "country": "usa",
                "format": "card"
            ]
        ]
        data["faceStep"] = [
            "type": "video",
            "intro": false
        ]
        
        let settings = try FlutterOnfidoSettings.fromMap(data: data)
        
        func onfidoConfigBuild() -> OnfidoConfigBuilder {
            return OnfidoConfigBuilder()
        }
        let flutterOnfidoPlus = FlutterOnfidoPlus(
            onfidoConfigBuild: onfidoConfigBuild
        )
        
        flutterOnfidoPlus.buildTheOnfidoConfig(settings: settings)
    }
    
}
