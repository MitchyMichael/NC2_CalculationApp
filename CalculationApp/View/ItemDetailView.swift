//
//  ItemDetailView.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 11/05/23.
//

import SwiftUI

struct ItemDetailView: View {
    
    @State var itemName: String
    @State var itemPrice: Int
    @State var itemImage: String
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var totalTodayIncome4: TotalIncome
    @StateObject var itemVM: ItemViewModel
    @StateObject var recentItemsVM: RecentItemsViewModel
    
    var body: some View {
        NavigationStack{
            if (itemImage == "" && itemPrice == 0 && itemName == ""){
                HStack{
                    Text("Error, please try again.")
                        .foregroundColor(.secondary)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
                
            } else {
                VStack{
                    Image(itemImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .clipped()
                    
                    HStack (alignment: .top){
                        VStack{
                            HStack{
                                Text("Item Name: " + itemName)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .font(.caption)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            HStack{
                                Text("Item Price: Rp " + String(itemPrice))
                                    .foregroundColor(.black)
                                    .font(.caption)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        
                        VStack{
                            // Edit Button ======================
                            Button {
                                dismiss()
                            } label: {
                                Text("Edit")
                                    .font(.caption)
                            }
                            .frame(width: 50)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(.blue)
                            .cornerRadius(8)
                            
                            // Remove Button ============================
                            Button {
                                if let index = itemVM.itemArr.firstIndex(where: { $0.name == itemName }) {
                                    itemVM.itemArr.remove(at: index)
                                    
                                    dismiss()
                                    
                                    let newView = ContentView(totalTodayIncome: totalTodayIncome4, itemVM: itemVM, recentItemsVM: recentItemsVM)
                                    UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: newView)
                                }
                                
                            } label: {
                                Text("Remove")
                                    .font(.caption)
                            }
                            .frame(width: 50)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(.red)
                            .cornerRadius(8)
                            
                            
                            // Close Button =============================
                            Button {
                                dismiss()
                            } label: {
                                Text("Close")
                                    .font(.caption)
                            }
                            .frame(width: 50)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(.blue)
                            .cornerRadius(8)
                            .padding(.top, 40)
                            
                        }
                        .padding(.horizontal)
            
                    }
                    .padding(.top)
                    Spacer()
                    
                    
                    
                    
                }
            }
            
        }
        
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(itemName: "", itemPrice: 0, itemImage: "", totalTodayIncome4: TotalIncome(), itemVM: ItemViewModel(), recentItemsVM: RecentItemsViewModel())
    }
}
