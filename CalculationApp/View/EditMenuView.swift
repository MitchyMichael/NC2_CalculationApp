//
//  AddMenu.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 05/05/23.
//

import SwiftUI

struct EditMenuView: View {
    @StateObject var totalTodayIncome3: TotalIncome
    @State var showingClickedAlert = false
    @State var isPresentedSheet = false
    
    @State var thisItemNames = ""
    @State var thisItemPrices = 0
    @State var thisItemImage = ""
    
    @StateObject var itemVM: ItemViewModel
    @StateObject var recentItemsVM: RecentItemsViewModel
    
    let rows = [
        GridItem(.fixed(110)),
        GridItem(.fixed(110)),
        GridItem(.fixed(110))
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Edit Menu")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button{
                        isPresentedSheet = true
                    } label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add Item")
                        }
                    }
                    .sheet(isPresented: $isPresentedSheet){
                        AddMenuView(totalTodayIncome2: totalTodayIncome3, itemVM: itemVM, recentItemsVM: recentItemsVM)
                    }
                }
                
                ScrollView{
                    LazyVGrid(columns: rows){
                        ForEach(itemVM.itemArr, content: { item in
                            Button{
                                showingClickedAlert = true
                                thisItemNames = item.name
                                thisItemPrices = item.price
                                thisItemImage = item.thisimage
                                
                            } label: {
                                VStack{
                                    Image(item.thisimage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80, alignment: .center)
                                        .clipped()
                                        .cornerRadius(4)
                                    
                                    Text(item.name)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .frame(width: 80, height: 10)
                                    
                                    Text("Rp " + item.price.description)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                    
                                }
                                
                                .padding()
                                .background(.white)
                                .cornerRadius(8)
                                
                            }
                            .sheet(isPresented: $showingClickedAlert){
                                ItemDetailView(itemName: thisItemNames, itemPrice: thisItemPrices, itemImage: thisItemImage)
                            }
                            
                        })
                    }
                    
                }
                .padding(.horizontal)
                .scrollIndicators(ScrollIndicatorVisibility.hidden)
                Spacer()
                
                
            }
            .padding()
            .background(Color(hue: 1.0, saturation: 0.000, brightness: 0.95))
        }
        .preferredColorScheme(.light)
    }
}

struct EditMenuView_Previews: PreviewProvider {
    static var previews: some View {
        EditMenuView(totalTodayIncome3: TotalIncome(), itemVM: ItemViewModel(), recentItemsVM: RecentItemsViewModel())
    }
}
