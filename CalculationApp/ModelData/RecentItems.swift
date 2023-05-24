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
    var time: String
    var transactionID: Int
    var date: Date
}

class RecentItemsViewModel: ObservableObject {
    var itemArr: [RecentItems] = [
//        RecentItems(name: "Americano", price: 25000, time: "4.53 AM", transactionID: 34626283463284, date: Date())
    ]
}
