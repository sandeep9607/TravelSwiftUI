//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by iMac on 07/11/23.
//

import SwiftUI

struct PopularDestinationsView : View {
    let destination : [Destination] = [
        .init(name: Constant.paris, country: Constant.france, imageName: Constant.eiffel_tower,latitude: 48.86511035631639 ,longitude: 2.360781046620948),
        .init(name: Constant.tokiyo, country: Constant.japan.capitalized, imageName: Constant.japan,latitude: 35.6996084110255 ,longitude: 139.78989930926414),
        .init(name: Constant.newYork, country: Constant.us, imageName: Constant.new_york,latitude: 40.71855786193556 ,longitude: -73.98888064271142),
        .init(name: Constant.jaunpur, country: Constant.uttarPradesh, imageName: Constant.jaunpur,latitude: 25.745996234596838 ,longitude: 82.69431594791281),
    ]
    var body: some View {
        VStack {
            HStack {
                Text(Constant.popularDestinations)
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text(Constant.seeAll)
                    .font(.system(size: 14,weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(destination, id: \.self) { destination in
                        NavigationLink {
                            NavigationLazyView(PopularDestinationDetailView(destination: destination))
                        } label: {
                            PopularDestinationTile(destination: destination)
                                .padding(.bottom)
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationTile: View {
    let destination : Destination
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 100)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical,6)
            
            HStack {
                Spacer()
            }
            
            Text(destination.name)
                .font(.system(size: 12,weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))
            
            Text(destination.country)
                .font(.system(size: 12,weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom,8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct TileModifer : ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
            .background(Color(Constant.tileModifier))
            .cornerRadius(5)
            .shadow(color: .init(.sRGB,white: 0.8,opacity: colorScheme == .light ? 1 : 0), radius: 4,x: 0.0,y: 2)
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailView(destination: Destination(name: Constant.jaunpur, country: Constant.uttarPradesh, imageName: Constant.uttarPradesh,latitude: 25.745996234596838 ,longitude: 82.69431594791281))
        }
        PopularDestinationsView()
    }
}
