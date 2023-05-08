//
//  ContentView.swift
//  CalculationApp
//
//  Created by Michael Wijaya Sutrisna on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var totalTodayIncome = 0
    @State private var showingResetAlert = false
    @State private var showingClickedAlert = false
    
    var body: some View {
        NavigationView{
            VStack{
                // Blue Gradient Card ==============================================
                VStack{
                    HStack{
                        Image(systemName: "opticaldiscdrive")
                        Text("Daily Income Tracker")
                        Spacer()
                        
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    
                    HStack{
                        VStack{
                            HStack{
                                Text("Your Income Today")
                                    .font(.caption)
                                    .padding(.horizontal)
                                    .padding(.top)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                            HStack{
                                Text("Rp " + String(totalTodayIncome))
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
                            Text("Reset Income")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                            
                        })
                        .alert("Reset Income", isPresented: $showingResetAlert, actions: {
                            Button("Reset", role: .destructive, action: {
                                totalTodayIncome = 0
                            })
                            Button("Cancel", role: .cancel, action: {})
                        }, message: {
                            Text("Are you sure you want to reset the income?")
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
                        
                        NavigationLink(destination: EditMenuView()) {
                            HStack{
                                Image(systemName: "pencil")
                                Text("Edit Menu")
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal){
                        VStack{
                            ForEach(1..<3){ index in
                                HStack{
                                    ForEach(1..<6){ index in
                                        Button{
                                            showingClickedAlert = true
                                        } label: {
                                            VStack{
                                                Image("americano")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 80, height: 80, alignment: .bottomTrailing)
                                                    .clipped()
                                                
                                                Text("Americano")
                                                    .font(.caption)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.black)
                                                
                                                Text("Rp 25.000")
                                                    .font(.caption)
                                                    .foregroundColor(.black)
                                                
                                            }
                                            .padding()
                                            .background(.white)
                                            .cornerRadius(8)
                                        }
                                        .alert("Add Item", isPresented: $showingClickedAlert, actions: {
                                            Button("Yes", action: {
                                                totalTodayIncome = totalTodayIncome + 25000
                                            })
                                            Button("Cancel", role: .cancel, action: {})
                                        }, message: {
                                            Text("Are you sure you want to add the item?")
                                        })
                                        
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    }
                    .scrollIndicators(ScrollIndicatorVisibility.hidden)
                    
                }
                .padding(.top)
                
                // Recent Income Section =====================================================
                VStack{
                    HStack{
                        Text("Recent Income")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ForEach(1..<4){ index in
                        HStack{
                            Text("Hot Tea")
                                .padding()
                            Spacer()
                            
                            VStack(alignment: .trailing){
                                Text("Rp 5.000")
                                    .padding(.horizontal)
                                    .font(.caption)
                                Text("x1")
                                    .padding(.horizontal)
                                    .font(.caption)
                            }
                            
                            
                        }
                        
                    }
                    .background(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
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
        ContentView()
    }
}
