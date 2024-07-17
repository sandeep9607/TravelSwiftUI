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
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a41cf22c-578d-456f-b0c4-90d5c017eab1",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/288b811b-048c-4427-a875-2edc65c23d76",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/4aff5261-6cea-49ad-a541-cb70b7f13ed3",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/781069ca-2f84-46b9-8597-abaa8344f574",
        "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/985e75ec-8f3e-44ff-bf13-a597ed3f0f6e",
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
        .navigationTitle("Restaurant Detail")
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
                            Image(systemName: "star.fill")
                        }
                        .foregroundColor(.orange)
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    Text("123")
                } label: {
                    Text("See more photos")
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
            Text("Location & Description")
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
        
//        if let reviews = vm.reservationDetailRes?.reviews {
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
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                }
            }

            Group {
                ForEach(0..<(5 - (rating ?? 0)), id: \.self) { num in
                    Image(systemName: "star.fill")
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
