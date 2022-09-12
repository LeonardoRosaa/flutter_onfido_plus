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
        data["appearence"] = [
            "primaryColor": [
                "red": 0,
                "blue": 0,
                "green": 0,
                "alpha": 0
            ],
            "primaryTitleColor": [
                "red": 0,
                "blue": 0,
                "green": 0,
                "alpha": 0
            ],
            "primaryBackgroundPressedColor": [
                "red": 0,
                "blue": 0,
                "green": 0,
                "alpha": 0
            ],
            "secondaryBackgroundPressedColor": [
                "red": 0,
                "blue": 0,
                "green": 0,
                "alpha": 0
            ],
            "buttonCornerRadius": 10.0,
            "supportDarkMode": true
        ]
        
        let settings = try FlutterOnfidoSettings.fromMap(data: data)
        let compare =  FlutterOnfidoSettings(
            token: "token",
            steps: [
                WelcomeStep(),
                WorkPermitConfigurationStep(country: .afg),
                DrivingLicenseConfigurationStep(country: .usa, format: .card)
            ],
            faceStep: FlutterOnfidoFaceStep(type: .video),
            appearence: FlutterOnfidoAppearence(
                primaryColor: Color(red: 0, blue: 0, green: 0, alpha: 0),
                primaryTitleColor: Color(red: 0, blue: 0, green: 0, alpha: 0),
                secondaryTitleColor: nil,
                primaryBackgroundPressedColor: Color(red: 0, blue: 0, green: 0, alpha: 0),
                secondaryBackgroundPressedColor: Color(red: 0, blue: 0, green: 0, alpha: 0),
                buttonCornerRadius: 10.0,
                fontRegular: nil,
                fontBold: nil,
                supportDarkMode: true
            )
        )
        
        XCTAssertEqual(settings, compare, "The settings classes should be equals")
    }
    
}
