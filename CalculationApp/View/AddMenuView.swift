//
//  AddMenuView.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 10/05/23.
//

import SwiftUI
import PhotosUI
struct AddMenuView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    
    @StateObject var totalTodayIncome2: TotalIncome
    
    @State var newMenuName = ""
    @State var newMenuPrice = 0
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var itemVM: ItemViewModel
    @StateObject var recentItemsVM: RecentItemsViewModel
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    @State var shouldShowImagePicker = false
    
    var body: some View {
        NavigationStack{
            HStack{
                ZStack{
                    Spacer()
                    
                    Text("Add New Menu")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack{
                        Button{
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        
                        Spacer()
                        
                        Button{
                            let newItem = Items(name: newMenuName, price: newMenuPrice, thisimage: "cappucino")
                            
                            var mutableItemArr = itemVM.itemArr
                            mutableItemArr.append(newItem)
                            
                            itemVM.itemArr = mutableItemArr
                            
                            print(itemVM.itemArr)
                            
                            let newView = ContentView(totalTodayIncome: totalTodayIncome2, itemVM: itemVM, recentItemsVM: recentItemsVM)
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                            
                            DataController().addItem(name: newMenuName, price: Int64(newMenuPrice), image: "cappucino", context: managedObjContext)
                            
                            dismiss()
                        } label: {
                            Text("Add")
                        }
                    }
                }
                
            }
            .padding()
            
            Form{
                Section(header: Text("New Menu Details")){
                    HStack{
                        Text("Menu Name")
                        Spacer()
                        TextField("Menu Name", text: $newMenuName)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("Menu Price")
                        Spacer()
                        TextField("Menu Price", value: $newMenuPrice, formatter: NumberFormatter()).keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("Menu Image")
                        
                        Spacer()
                    
                        PhotosPicker(
                            selection: $selectedItems,
                            maxSelectionCount: 1,
                            matching: .images
                        ){
                            Text("Pick Photo")
                        }
                        .onChange(of: selectedItems){ newValue in
                            
                            guard let item = selectedItems.first else {
                                return
                            }
                            item.loadTransferable(type: Data.self) { result in
                                switch result {
                                case .success(let data):
                                    if let data = data {
                                        self.data = data
                                    } else {
                                        print("Data is nil")
                                    }
                                case .failure(let failure):
                                    fatalError("\(failure)")
                                    
                                }
                            }
                        }
                    }
                    if let data = data, let uiimage = UIImage(data: data){
                        Image(uiImage: uiimage).resizable().scaledToFit()
                        
                    }
                }
                
            }
            .scrollContentBackground(.hidden)
            .background(Color(hue: 1.0, saturation: 0.000, brightness: 0.95))
        }
        
        .navigationTitle("Add New Menu")
    }
    
    
}

struct AddMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AddMenuView(totalTodayIncome2: TotalIncome(), itemVM: ItemViewModel(), recentItemsVM: RecentItemsViewModel())
    }
}

