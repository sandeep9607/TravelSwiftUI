//
//  PopularRestaurantView.swift
//  TravelDiscovery
//
//  Created by iMac on 07/11/23.
//

import SwiftUI


struct PopularRestaurantView : View {
    
    let restaurant : [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text(Constant.seeAll)
                    .font(.system(size: 14,weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(restaurant, id: \.self) { restaurant in
                        NavigationLink {
                            RestaurantDetailView(restaurant: restaurant)
                        } label: {
                            RestaurantTile(restaurant: restaurant)
                                .foregroundColor(Color(.label))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
    }
    
    struct RestaurantTile : View {
        
        let restaurant : Restaurant
        var body: some View {
            
            HStack(spacing: 8) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60,height: 60)
                    .clipped()
                    .background(.gray)
                    .padding(.leading,6)
                    .padding(.vertical,6)
                
                VStack(alignment: .leading,spacing: 6) {
                    HStack {
                        Text(restaurant.name)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.gray)
                        }
                        
                        
                    }
                    
                    HStack {
                        Image(systemName: Constant.starFill)
                        Text("4.7 . Satish . $$")
                    }
                    
                    Text("Tokyo, Japan")
                }
                .font(.system(size: 12,weight: .semibold))
                Spacer()
            }
            .modifier(CustomModifer())
            .padding(.bottom)
        }
    }
    
    struct CustomModifer : ViewModifier {
        
        @Environment(\.colorScheme) var colorScheme
        
        func body(content: Content) -> some View {
            content
                .frame(width: 240)
                .background(Color("TileModifier"))
                .cornerRadius(5)
                .shadow(color: .init(.sRGB,white: 0.8,opacity: colorScheme == .light ? 1 : 0), radius: 4,x: 0.0,y: 2)
        }
    }
    
    struct PopularRestaurantView_Previews: PreviewProvider {
        static var previews: some View {
            PopularRestaurantView()
        }
    }
}
