//
//  DataController.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 09/06/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    let container = NSPersistentContainer(name: "ItemsModel")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addItem(name: String, price: Int64, image: String, context: NSManagedObjectContext) {
        let items = ItemsNew(context: context)
        items.itemId = UUID()
        items.itemName = name
        items.itemPrice = price
        items.itemImage = image
        
        save(context: context)
    }
    
    func editItem(item: ItemsNew, name: String, price: Int64, image: String, context: NSManagedObjectContext) {
        item.itemName = name
        item.itemPrice = price
        item.itemImage = image
        
        save(context: context)
    }
    
    func seedInitialData() {
//        Items(name: "Americano", price: 25000, thisimage: "americano"),
//        Items(name: "Cappucino", price: 35000, thisimage: "cappucino"),
//        Items(name: "Latte", price: 38000, thisimage: "latte"),
//        Items(name: "Cold Brew", price: 36000, thisimage: "coldbrew"),
//        Items(name: "Mexican Hot Coffee", price: 27000, thisimage: "mexican"),
//        Items(name: "Hot Chocolate", price: 35800, thisimage: "hotchocolate"),
//        Items(name: "Black Coffee", price: 31000, thisimage: "black"),
        
        let context = container.viewContext
        
        let item = ItemsNew(context:context)
        item.itemName = "Cappucino"
        item.itemPrice = 32000
        item.itemImage = "cappucino"
        
        let item2 = ItemsNew(context:context)
        item2.itemName = "Americano"
        item2.itemPrice = 30000
        item2.itemImage = "americano"
        
        let item3 = ItemsNew(context:context)
        item3.itemName = "Latte"
        item3.itemPrice = 42000
        item3.itemImage = "latte"
        
        let item4 = ItemsNew(context:context)
        item4.itemName = "Cold Brew"
        item4.itemPrice = 40000
        item4.itemImage = "coldbrew"
        
        let item5 = ItemsNew(context:context)
        item5.itemName = "Mexican Hot Coffee"
        item5.itemPrice = 47000
        item5.itemImage = "mexican"
        
        let item6 = ItemsNew(context:context)
        item6.itemName = "Hot Chocolate"
        item6.itemPrice = 50000
        item6.itemImage = "hotchocolate"
        
        let item7 = ItemsNew(context:context)
        item2.itemName = "Black Coffee"
        item2.itemPrice = 32000
        item2.itemImage = "black"

        do {
            try context.save()
        } catch {
            fatalError("Failed to save initial data: \(error)")
        }
    }
}
