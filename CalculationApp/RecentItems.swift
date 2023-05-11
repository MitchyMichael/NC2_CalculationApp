//
//  RecentItems.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 09/05/23.
//

import Foundation

struct RecentItems: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
}

class RecentItemsViewModel: ObservableObject {
    var itemArr: [RecentItems] = [
//        RecentItems(name: "Americano", price: 25000)
    ]
}
