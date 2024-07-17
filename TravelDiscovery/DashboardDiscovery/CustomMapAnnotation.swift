//
//  CustomMapAnnotation.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import SwiftUI

struct CustomMapAnnotation: View {
    
    let attraction : Attraction
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width: 80,height: 60)
                .cornerRadius(4)
            Text(attraction.name)
                .padding(.horizontal,6)
                .padding(.vertical,4)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(4)
                .overlay {
                    RoundedRectangle(cornerRadius: 4).stroke(Color(.init(white: 0, alpha: 0.5)))
                }
        }
        .shadow(radius: 4)
    }
}

struct CustomMapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapAnnotation(attraction: Attraction(name: Constant.eiffelTower, imageName: Constant.eiffel_tower, latitude: 48.858498772319145, longitude: 2.2947650570767477))
    }
}
