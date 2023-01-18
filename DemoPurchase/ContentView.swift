//
//  ContentView.swift
//  DemoPurchase
//
//  Created by Alexey Koleda on 18.01.2023.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    private let productIds = ["pro_monthly", "pro_yearly", "pro_lifetime"]

    @State
    private var products: [Product] = []

    var body: some View {
        VStack(spacing: 20) {
            Text("Products")
            ForEach(self.products) { product in
                Button {
                    // Don't do anything yet
                } label: {
                    Text("\(product.displayPrice) - \(product.displayName)")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Capsule())
                }
            }
        }.task {
            do {
                try await self.loadProducts()
            } catch {
                print(error)
            }
        }
    }

    private func loadProducts() async throws {
        // Products are not returned in the order the ids are requested
        self.products = try await Product.products(for: productIds)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
