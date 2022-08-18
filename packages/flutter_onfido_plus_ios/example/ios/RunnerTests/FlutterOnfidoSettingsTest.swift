//
//  FlutterOnfidoSettingsTest.swift
//  RunnerTests
//
//  Created by Leonardo Rosa on 15/08/22.
//

import XCTest
@testable import flutter_onfido_plus_ios

class FlutterOnfidoSettingsTest: XCTestCase {
    
    func testParseMap() throws {
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
        let compare =  FlutterOnfidoSettings(
            token: "token",
            steps: [
                WelcomeStep(),
                WorkPermitConfigurationStep(country: .afg),
                DrivingLicenseConfigurationStep(country: .usa, format: .card)
            ],
            faceStep: FlutterOnfidoFaceStep(type: .video)
        )
        
        XCTAssertEqual(settings, compare, "The settings classes should be equals")
    }
    
}
