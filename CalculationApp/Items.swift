//
//  ItemList.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 08/05/23.
//

import Foundation

struct Items: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
}

class ItemViewModel: ObservableObject {
    let itemArr: [Items] = [
        Items(name: "Americano", price: 25000),
        Items(name: "Cappucino", price: 35000),
        Items(name: "Latte", price: 38000),
        Items(name: "Cold Brew", price: 36000)
    ]
}


