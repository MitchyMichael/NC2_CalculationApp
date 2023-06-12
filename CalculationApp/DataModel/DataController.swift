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
        let context = container.viewContext
        
        let item = ItemsNew(context:context)
        item.itemName = "Cappucino"
        item.itemPrice = 32000
        item.itemImage = "cappucino"
        
        do {
            try context.save()
        } catch {
            fatalError("Failed to save initial data: \(error)")
        }
    }
}
