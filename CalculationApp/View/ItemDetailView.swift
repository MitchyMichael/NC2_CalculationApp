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
    
    var body: some View {
        NavigationStack{
            VStack{
                Image(itemImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                    
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
                .padding(.top)
                
                Spacer()

            }
        }
        
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(itemName: "", itemPrice: 0, itemImage: "")
    }
}
