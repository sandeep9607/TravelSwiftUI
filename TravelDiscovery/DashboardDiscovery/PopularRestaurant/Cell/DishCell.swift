//
//  DishCell.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//

import SwiftUI
import Kingfisher

struct Dishcell : View {
    
    let dish : PopularDish
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: dish.photo ?? ""))
                    .resizable()
                    .scaledToFill()
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .shadow(radius: 2)
                    .padding(.vertical,2)
                
                LinearGradient(gradient: Gradient(colors: [Color.clear,Color.black]), startPoint: .center, endPoint: .bottom)
                
                Text(dish.price ?? "")
                    .font(.system(size: 13,weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal,8)
                    .padding(.bottom,4)
                
            }
            .frame(height: 120)
            .cornerRadius(5)
            
            Text(dish.name ?? "")
                .font(.system(size: 14,weight: .bold))
            
            Text("\(dish.numPhotos ?? 0)" + " photos")
                .font(.system(size: 16,weight: .regular))
                .foregroundColor(.gray)
        }
    }
}
