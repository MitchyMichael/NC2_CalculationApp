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
    var image: String
}

class ItemViewModel: ObservableObject {
    var itemArr: [Items] = [
        Items(name: "Americano", price: 25000, image: "americano"),
        Items(name: "Cappucino", price: 35000, image: "cappucino"),
        Items(name: "Latte", price: 38000, image: "latte"),
        Items(name: "Cold Brew", price: 36000, image: "coldbrew"),
        Items(name: "Mexican Hot Coffee", price: 27000, image: "mexican"),
        Items(name: "Hot Chocolate", price: 35800, image: "hotchocolate"),
        Items(name: "Black Coffee", price: 31000, image: "black"),
        
    ]
}


