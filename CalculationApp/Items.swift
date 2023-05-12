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
    var thisimage: String
}

class ItemViewModel: ObservableObject {
    var itemArr: [Items] = [
        Items(name: "Americano", price: 25000, thisimage: "americano"),
        Items(name: "Cappucino", price: 35000, thisimage: "cappucino"),
        Items(name: "Latte", price: 38000, thisimage: "latte"),
        Items(name: "Cold Brew", price: 36000, thisimage: "coldbrew"),
        Items(name: "Mexican Hot Coffee", price: 27000, thisimage: "mexican"),
        Items(name: "Hot Chocolate", price: 35800, thisimage: "hotchocolate"),
        Items(name: "Black Coffee", price: 31000, thisimage: "black"),
    ]
}


