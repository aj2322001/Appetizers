//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Archit  Joshi on 07/02/26.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
