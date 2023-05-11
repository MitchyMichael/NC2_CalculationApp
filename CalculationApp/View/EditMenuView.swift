//
//  AddMenu.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 05/05/23.
//

import SwiftUI

struct EditMenuView: View {
    @State var showingClickedAlert = false
    @State var isPresentedSheet = false
    
    @State var thisItemNames = ""
    @State var thisItemPrices = 0
    
    @StateObject var itemVM: ItemViewModel
    
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
                        AddMenuView(itemVM: itemVM)
                    }
                }

                ScrollView{
                    LazyVGrid(columns: rows){
                        ForEach(itemVM.itemArr, content: { item in
                            Button{
                                showingClickedAlert = true
                                thisItemNames = item.name
                                thisItemPrices = item.price
                            } label: {
                                VStack{
                                    Image(item.image)
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
        EditMenuView(itemVM: ItemViewModel())
    }
}
