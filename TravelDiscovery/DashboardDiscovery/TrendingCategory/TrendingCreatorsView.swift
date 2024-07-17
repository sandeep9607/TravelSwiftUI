//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by iMac on 07/11/23.
//

import SwiftUI


struct TrendingCreatorsView: View {
    
    let user : [User] = [
        .init(id: 0, name: "Amy Adams", imageName: "amy"),
        .init(id: 1, name: "Billy Anderson", imageName: "billy"),
        .init(id: 2, name: "Sam Andrew", imageName: "sam"),
        
    ]
    var body: some View {
        
        VStack {
            HStack {
                
                Text("Trending Creators")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text(Constant.seeAll)
                    .font(.system(size: 14,weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(alignment: .top,spacing: 12) {
                    ForEach(user , id: \.self) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            DiscoverUserView(user: user)
                        }
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DiscoverUserView : View {
    
    let user : User
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60,height: 60)
                .cornerRadius(60)
            
            Text(user.name)
                .font(.system(size: 11,weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .shadow(color: .gray
                , radius: 4,x: 0.0,y: 2)
        .padding(.bottom)
    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
