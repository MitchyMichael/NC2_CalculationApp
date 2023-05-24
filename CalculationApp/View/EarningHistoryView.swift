//
//  EarningHistoryView.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 25/05/23.
//

import SwiftUI

struct EarningHistoryView: View {
    
    @StateObject var recentItemsVM: RecentItemsViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                HStack{
                    Button{
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                    
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("Earning History Details")
                        .fontWeight(.bold)
                    Spacer()
                }
            }
            .padding()
            
            ScrollView{
                if (recentItemsVM.itemArr.count == 0) {
                    VStack{
                        Text("You Haven't Sold Any Items Yet")
                            .foregroundColor(.secondary)
                            .frame(height: 150)
                    }
                    
                } else {
                    
                    ForEach(recentItemsVM.itemArr.reversed(), content: { recentItem in
                        HStack (alignment: .bottom){
                            VStack{
                                HStack{
                                    Text("Transaction ID: " + String(recentItem.transactionID))

                                    Spacer()
                                    Text(recentItem.date, style: .date)

                                    
                                }
                                .font(.caption)
                                .foregroundColor(.secondary)

                                HStack{
                                    Text(recentItem.time)
                                    Divider()
                                    Text(recentItem.name)
                                    Spacer()
                                    Text("Rp " + recentItem.price.description)
                                }
                                
                            }

                            
                        }
                        .padding(.top)
                        .padding(.horizontal)

                        Divider()
                            .padding(.horizontal)
                    })
                    
                    
                }
            }
            
        }
        
        
        
    }
}

struct EarningHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        EarningHistoryView(recentItemsVM: RecentItemsViewModel())
    }
}
