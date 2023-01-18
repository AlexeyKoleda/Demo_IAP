//
//  EntitlementManager.swift
//  DemoPurchase
//
//  Created by Alexey Koleda on 18.01.2023.
//

import SwiftUI

class EntitlementManager: ObservableObject {
    static let userDefaults = UserDefaults(suiteName: "group.your.app")!

    @AppStorage("hasPro", store: userDefaults)
    var hasPro: Bool = false
}
