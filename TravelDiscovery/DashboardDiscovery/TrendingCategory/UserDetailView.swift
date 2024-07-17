//
//  UserDetailView.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//

import SwiftUI
import Kingfisher

struct UserDetailView: View {
    
    
    @ObservedObject var vm : TrendingCategoryViewModel
    let user : User
    
    init(user: User) {
        self.user = user
        self.vm = .init(userId: user.id)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                if let userRes = vm.userDetailResponse {
                    UserView(user: user, userRes: userRes)
                }
                
                UserButtonView()
                
                if let userRes = vm.userDetailResponse {
                    PostCardView(userRes: userRes)
                }
            }
        }.navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserView : View {
    
    let user : User
    let userRes : UserDetailResponse
    
    var body: some View {
        Image(user.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 60)
            .clipShape(Circle())
            .shadow(radius: 10)
            .padding(.horizontal)
            .padding(.top)
        
        Text(user.name)
            .font(.system(size: 14,weight: .semibold))
            .padding(.top,5)
        
        HStack {
            Text("\(userRes.username ?? "") .")
            Image(systemName: "hand.thumbsup.fill")
                .font(.system(size: 10,weight: .semibold))
            Text("2541")
        }
        .font(.system(size: 12,weight: .regular))
        
        Text("YouTuber, Vlogger, Travel Creator")
            .font(.system(size: 14,weight: .regular))
            .foregroundColor(Color(.lightGray))
        
        HStack(spacing: 12) {
            VStack {
                Text("\(userRes.followers ?? 0)")
                    .font(.system(size: 13,weight: .semibold))
                Text("Followers")
                    .font(.system(size: 9,weight: .regular))
            }
            
            Spacer()
                .frame(width: 0.5,height: 12)
                .background(Color(.lightGray))
            
            VStack {
                Text("\(userRes.following ?? 0)")
                    .font(.system(size: 13,weight: .semibold))
                Text("Following")
                    .font(.system(size: 9,weight: .regular))
            }
        }
    }
}

struct UserButtonView : View {
    var body: some View {
        HStack(spacing: 12) {
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    Text(Constant.follow)
                        .font(.system(size: 12,weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical,8)
                .background(.orange)
                .cornerRadius(100)
            }
            
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    Text(Constant.contact)
                        .font(.system(size: 12,weight: .semibold))
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.vertical,8)
                .background(Color(white: 0.9))
                .cornerRadius(100)
            }
        }
        .font(.system(size: 11,weight: .semibold))
        .padding(.horizontal)
    }
}

struct PostCardView : View {
    
    let userRes : UserDetailResponse
    var body: some View {
        ForEach(userRes.posts ?? [] , id: \.self) { post in
            
            VStack(alignment: .leading,spacing: 12) {
                KFImage(URL(string: post.imageURL ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                
                HStack {
                    KFImage(URL(string: userRes.profileImage ?? ""))
                        .resizable()
                        .scaledToFit()
                        .frame(height: 34)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading,spacing: 5) {
                        
                        Text(post.title ?? "")
                            .font(.system(size: 14,weight: .semibold))
                        
                        Text("\(post.views ?? "") views")
                            .font(.system(size: 12,weight: .regular))
                            .foregroundColor(Color(.gray))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal,8)
                
                HStack {
                    
                    ForEach(post.hashtags ?? [], id: \.self) { hashtag in
                        Text("#\(hashtag)")
                            .foregroundColor(Color(.systemBlue))
                            .font(.system(size: 14,weight: .semibold))
                            .padding(.horizontal,12)
                            .padding(.vertical,4)
                            .background(Color(.init(red: 0, green: 0, blue: 0.4, alpha: 0.1)))
                            .cornerRadius(20)
                            .lineLimit(1)
                    }
                    
                }
                .padding(.bottom)
                .padding(.horizontal,8)
                
            }
            //            .frame(height: 200)
            .background(.white)
            .cornerRadius(12)
            .shadow(color: .init(white: 0.8), radius: 5,x: 0,y: 4)
            .padding()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        UserDetailView(user: .init(id: 0, name: "Amy Adam", imageName: "amy"))
    }
}
