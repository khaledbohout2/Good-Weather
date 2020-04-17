//
//  SettingViewModel.swift
//  GoodWeather
//
//  Created by Khaled Bohout on 4/14/20.
//  Copyright © 2020 khaled. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fehrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch (self) {
            case .celsius:
                return "Celsius"
            case .fehrenheit:
                return "Fehrenheit"
            }
        }
    }
}

struct SettingViewModel {
    
    let units = Unit.allCases
    private var _selectedUnit: Unit = Unit.fehrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                return Unit(rawValue: value)!
            }
            
            return _selectedUnit
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
