//
//  CalculationAppApp.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 02/05/23.
//

import SwiftUI

@main
struct CalculationAppApp: App {
    @StateObject private var dataController:DataController = DataController()
    @AppStorage("firstTime") var firstTime = true
    
    var body: some Scene {
        WindowGroup {
            ContentView(totalTodayIncome: TotalIncome(), itemVM: ItemViewModel(), recentItemsVM: RecentItemsViewModel())
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .onAppear{
                    if firstTime {
                        dataController.seedInitialData()
                        firstTime = false
                    }
                }
        }
    }
}
