//
//  CalculationAppApp.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 02/05/23.
//

import SwiftUI

@main
struct CalculationAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(itemVM: ItemViewModel())
        }
    }
}
