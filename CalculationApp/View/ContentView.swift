//
//  ContentView.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 02/05/23.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var totalIncome = TotalIncome()
    
    @StateObject var totalTodayIncome: TotalIncome
    @State private var showingResetAlert = false
    @State private var showingClickedAlert = false
    
    @State var thisItemNames = ""
    @State var thisItemPrices = 0
    
    @StateObject var itemVM: ItemViewModel
    @StateObject var recentItemsVM: RecentItemsViewModel
    
    let rows = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        NavigationStack{
            VStack{
                
                // Blue Gradient Card =======================================================
                VStack{
                    HStack{
                        Image(systemName: "opticaldiscdrive")
                        Text("Daily Earning Tracker")
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    
                    HStack{
                        VStack{
                            HStack{
                                Text("Total Earning Today")
                                    .font(.caption)
                                    .padding(.horizontal)
                                    .padding(.top)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                            HStack{
                                Text("Rp " + String(totalTodayIncome.totalIncome))
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.horizontal)
                                    .padding(.bottom)
                                    .foregroundColor(.white)

                                Spacer()
                            }
                        }
                        
                        Button(action: {
                            showingResetAlert = true
                        }, label: {
                            Text("Reset Earning")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()

                        })
                        .alert("Reset Earning", isPresented: $showingResetAlert, actions: {
                            Button("Reset", role: .destructive, action: {
                                totalTodayIncome.totalIncome = 0
                                recentItemsVM.itemArr = []
                            })
                            Button("Cancel", role: .cancel, action: {})
                        }, message: {
                            Text("Are you sure you want to reset your earning?")
                        })

                        .background(
                            LinearGradient(gradient: Gradient(colors: [.pink, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(30)
                        .padding()
                        .shadow(radius: 3, x: 2, y: 2)
                    }
                    
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(8)
                .padding(.horizontal)
                
                // Menu Items Section ===============================================
                VStack{
                    HStack{
                        Text("Menu Items")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        NavigationLink(destination: EditMenuView(totalTodayIncome3: totalTodayIncome, itemVM: itemVM, recentItemsVM: recentItemsVM)) {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Edit Menu")
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, alignment: .center) {
                            ForEach(itemVM.itemArr, content: { item in
                                Button{
                                    showingClickedAlert = true
                                    thisItemNames = item.name
                                    thisItemPrices = item.price
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
                                            .frame(width: 80)

                                        Text("Rp " + item.price.description)
                                            .font(.caption)
                                            .foregroundColor(.black)

                                    }
                                    .padding()
                                    .background(.white)
                                    .cornerRadius(8)

                                }

                                .alert("Add Item", isPresented: $showingClickedAlert, actions: {
                                    Button("Yes", action: {
                                        totalTodayIncome.totalIncome = totalTodayIncome.totalIncome + thisItemPrices

                                        let newItem = RecentItems(name: thisItemNames, price: thisItemPrices)

                                        var mutableItemArr = recentItemsVM.itemArr
                                        mutableItemArr.append(newItem)

                                        recentItemsVM.itemArr = mutableItemArr
                                    })
                                    Button("Cancel", role: .cancel, action: {})
                                }, message: {
                                    Text("Are you sure you want to add the item? " + thisItemNames + " " + String(thisItemPrices))
                                })

                            })
                        }
                        .padding(.horizontal)
                    }
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                }
                .padding(.top)
                
                // Recent Income Section =====================================================
                VStack{
                    HStack{
                        Text("Earning History")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    if (recentItemsVM.itemArr.count == 0) {
                        VStack{
                            Text("You Haven't Sold Any Items Yet")
                                .foregroundColor(.secondary)
                                .frame(height: 150)
                        }
                        
                    } else {
                        ScrollView{
                            ForEach(recentItemsVM.itemArr.reversed(), content: { recentItem in
                                HStack{
                                    Text(recentItem.name)
                                    Spacer()
                                    Text("Rp " + recentItem.price.description)
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                .font(.caption)
                                Divider()
                                    .padding(.horizontal)
                            })
                        }
                        .background(.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                    }

                    
                }
                .padding(.top)
                Spacer()
            }
            .background(Color(hue: 1.0, saturation: 0.000, brightness: 0.95))
            
        }
        .preferredColorScheme(.light)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(totalTodayIncome: TotalIncome(), itemVM: ItemViewModel(), recentItemsVM: RecentItemsViewModel())
    }
}
