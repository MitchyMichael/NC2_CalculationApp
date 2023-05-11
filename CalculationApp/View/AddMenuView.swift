//
//  AddMenuView.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 10/05/23.
//

import SwiftUI

struct AddMenuView: View {
    
    @State var newMenuName = ""
    @State var newMenuPrice = 0
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var itemVM: ItemViewModel
    
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
                            let newItem = Items(name: newMenuName, price: newMenuPrice, image: "cappucino")
                            
                            var mutableItemArr = itemVM.itemArr
                            mutableItemArr.append(newItem)
                            
                            itemVM.itemArr = mutableItemArr
                            
                            print(itemVM.itemArr)
                            
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
        AddMenuView(itemVM: ItemViewModel())
    }
}
