//
//  ResaurantDetailView.swift
//  TravelDiscovery
//
//  Created by iMac on 18/11/23.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailView: View {
    
    let restaurant : Restaurant
    
    @ObservedObject var vm = RestaurantDetailViewModel()
    
    let sampleDishes = [
        UrlEndPoint.amazona41Url,
        UrlEndPoint.amazona28Url,
        UrlEndPoint.amazona4aUrl,
        UrlEndPoint.amazona78Url,
        UrlEndPoint.amazona98Url,
    ]
    
    var body: some View {
        ScrollView {
            
            RestaurantDishesView(restaurant: restaurant)
            
            if let description = vm.reservationDetailRes?.description {
                LocationDescriptionView(description: description)
            }
            
            if let popularDishes = vm.reservationDetailRes?.popularDishes {
                PopularDishesView(popularDishes: popularDishes)
            }
            
            if let review = vm.reservationDetailRes?.reviews {
                ReviewListView(reviews: review)
            }
            
        }
        .navigationTitle(Constant.restaurantDetail)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RestaurantDishesView: View {
    
    let restaurant : Restaurant
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
            
            LinearGradient(gradient: Gradient(colors: [Color.clear,Color.black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                VStack(alignment: .leading,spacing: 4) {
                    Text(restaurant.name)
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(.white)
                    
                    HStack {
                        ForEach(0..<5, id: \.self) { num in
                            Image(systemName: Constant.starFill)
                        }
                        .foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    RestaurantPhotosView()
                } label: {
                    Text(Constant.seeMorePhotos)
                        .foregroundColor(.white)
                        .font(.system(size: 14,weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }  
            }.padding()
        }
    }
}

struct LocationDescriptionView : View {
    
    let description : String
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(Constant.locationDescription)
                .font(.system(size: 16,weight: .bold))
            
            Text("Tokyo , Japan")
            
            HStack {
                ForEach(0..<3, id: \.self) { num in
                    Image(systemName: "dollarsign.circle.fill")
                }
                .foregroundColor(.orange)
            }
            
            HStack {
                Spacer()
            }
            
        }
        .padding(.top)
        .padding(.horizontal)
        
        Text(description)
            .padding(.top,8)
            .font(.system(size: 14,weight: .regular))
            .padding(.horizontal)
            .padding(.bottom)
    }
}

struct PopularDishesView : View {
    
    let popularDishes : [PopularDish]
    
    var body: some View {
        HStack {
            Text("Popular Dishes")
                .font(.system(size: 16,weight: .bold))
            
            Spacer()
        }
        .padding(.horizontal)
        
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(popularDishes, id: \.self) { dish in
                    Dishcell(dish: dish)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ReviewListView : View {
    let reviews : [Reviews]
    
    var body: some View {
        HStack {
            Text("Customer Reviews")
                .font(.system(size: 16,weight: .bold))
            Spacer()
        }
        .padding(.horizontal)
        
        ForEach(reviews , id: \.self) { review in
            VStack(alignment: .leading) {
                HStack {
                    KFImage(URL(string: review.user?.profileImage ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("\(review.user?.firstName ?? "") \(review.user?.lastName ?? "")")
                            .font(.system(size: 14,weight: .bold))
                        
                        RatingStarsView(rating: review.rating)
                    }
                    
                    Spacer()
                    
                    Text("Dec 2020")
                        .font(.system(size: 14,weight: .bold))
                }
                
                Text(review.text ?? "")
            }
            .padding(.horizontal)
            .padding(.top)
        }
        //        }
    }
}

struct RatingStarsView: View {
    let rating: Int?
    
    var body: some View {
        HStack(spacing: 4) {
            
            Group {
                ForEach(0..<(rating ?? 0), id: \.self) { num in
                    Image(systemName: Constant.starFill)
                        .foregroundColor(.orange)
                }
            }
            
            Group {
                ForEach(0..<(5 - (rating ?? 0)), id: \.self) { num in
                    Image(systemName: Constant.starFill)
                        .foregroundColor(.gray)
                }
            }
        }
        .font(.system(size: 12))
    }
}


struct ResaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailView(restaurant: Restaurant(name: "Japan's Finest Tapas", imageName: "tapas"))
        }
    }
}
