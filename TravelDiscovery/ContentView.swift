//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by iMac on 07/11/23.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor : UIColor.white
        ]
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.yellow,Color.orange]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y:500)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: Constant.magnifyingglass)
                        Text(Constant.whereDoYouWantToGo)
                        Spacer()
                    }
                    .font(.system(size: 14,weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 0.95, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding()
                    
                    DiscoverCategories()
                    
                    VStack {
                        PopularDestinationsView()
                        
                        PopularRestaurantView()
                        
                        TrendingCreatorsView()
                    }
                    .background(Color.defaultBackground)
                    .cornerRadius(16)
                    .padding(.top,32)
                }
            }
            .navigationTitle(Constant.discover)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
