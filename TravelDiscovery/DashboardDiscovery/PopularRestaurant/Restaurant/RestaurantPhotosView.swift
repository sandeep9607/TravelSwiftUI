//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//

import SwiftUI
import Kingfisher

struct RestaurantPhotosView: View {
    
    @State var mode = "Grid"
    
    @State var shouldShowFullScreenModel = false
    @State var selectedPhotoIndex = 0
    
    let urlString = [
        UrlEndPoint.amazona5993Url,
        UrlEndPoint.amazona4c79Url,
        UrlEndPoint.amazona3de7Url,
        UrlEndPoint.amazona2f10Url,
        UrlEndPoint.amazona44e5Url,
        UrlEndPoint.amazona4a2bUrl,
        UrlEndPoint.amazona4df9Url,
        UrlEndPoint.amazona4444Url,
        UrlEndPoint.amazona4e5eUrl,
        UrlEndPoint.amazona4674Url,
        UrlEndPoint.amazona42acUrl,
        UrlEndPoint.amazona4129Url,
        UrlEndPoint.amazona42c1Url,
        UrlEndPoint.amazona4559Url,
        UrlEndPoint.amazona4fa7Url,
        UrlEndPoint.amazona4043Url,
        UrlEndPoint.amazona46acUrl
    ]
    
    init() {
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().selectedSegmentTintColor = .orange
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        UISegmentedControl.appearance()
            .setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        UISegmentedControl.appearance()
            .setTitleTextAttributes(titleTextAttributes, for: .normal)
    }
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
                Spacer()
                    .fullScreenCover(isPresented: $shouldShowFullScreenModel) {
                        ZStack(alignment: .topLeading) {
                            Color.black.ignoresSafeArea()
                            
                            RestaurantCarouselView(imageNames: urlString, selectedIndex: selectedPhotoIndex)
                            Button {
                                shouldShowFullScreenModel.toggle()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 32,weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            
                        }
                    }
                    .opacity(shouldShowFullScreenModel ? 1 : 0)
                
                Picker("Test", selection: $mode) {
                    Text("Grid").tag("grid")
                    Text("List").tag("list")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                if mode == "grid" {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: (UIScreen.main.bounds.size.width / 3) - 6, maximum: 300), spacing: 2)
                    ], spacing: 4) {
                        ForEach(urlString, id: \.self) { url in
                            
                            Button {
                                selectedPhotoIndex = urlString.firstIndex(of: url) ?? 0
                                shouldShowFullScreenModel.toggle()
                            } label: {
                                KFImage(URL(string: url))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: (UIScreen.main.bounds.size.width / 3) - 3, height: (UIScreen.main.bounds.size.width / 3) - 3)
                                    .clipped()
                            }
                            
                        }
                    }
                    .padding(.horizontal, 2)
                } else {
                    ForEach(urlString, id: \.self) { url in
                        VStack(alignment: .leading, spacing: 8) {
                            KFImage(URL(string: url))
                                .resizable()
                                .scaledToFill()
                            
                            HStack {
                                Image(systemName: "heart")
                                Image(systemName: "bubble.right")
                                Image(systemName: "paperplane")
                                Spacer()
                                Image(systemName: "bookmark")
                            }
                            .padding(.horizontal,8)
                            .font(.system(size: 22))
                            
                            Text("Description for your post and it's goes here, make sure to use a bunch of lines of text otherwise you never know what's going to happen.\n\nGreat job everyone")
                                .font(.system(size: 14))
                                .padding(.horizontal,8)
                            
                            Text("Posted on 20/11/2023")
                                .font(.system(size: 14))
                                .padding(.horizontal,8)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.bottom)
                    .padding(.horizontal, 2)
                }
            }
            .navigationTitle("All Photos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView()
        }
        //        .previewLayout(.fixed(width: 800, height: 400))
    }
}
