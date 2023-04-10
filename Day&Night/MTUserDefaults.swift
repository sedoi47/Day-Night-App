//
//  MTUserDefaults.swift
//  26.6 HW-1
//
//  Created by family Sedykh on 07.04.2023.
//

import Foundation

struct MTUserDefaults {
    
    static var shared = MTUserDefaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .light
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
