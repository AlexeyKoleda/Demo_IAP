//
//  DemoPurchaseApp.swift
//  DemoPurchase
//
//  Created by Alexey Koleda on 18.01.2023.
//

import SwiftUI

@main
struct DemoPurchaseApp: App {
    @StateObject
    private var purchaseManager = PurchaseManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(purchaseManager)
                .task {
                    await purchaseManager.updatePurchasedProducts()
                }
        }
    }
}
