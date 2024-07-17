//
//  DiscoverCategories.swift
//  TravelDiscovery
//
//  Created by iMac on 07/11/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

struct DiscoverCategories: View {
    let category : [Category] = [
        .init(name: Constant.art, imageName: Constant.paintPaletteFill),
        .init(name: Constant.sport, imageName: Constant.sportsCourtFill),
        .init(name: Constant.liveEvents, imageName: Constant.musicMic),
        .init(name: Constant.food, imageName: Constant.forkKnife),
        .init(name: Constant.history, imageName: Constant.rectangleAndPencilAndEllipsis),
    ]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .top,spacing: 16) {
                ForEach(category , id: \.self) { category in
                    NavigationLink {
                        NavigationLazyView(CategoryDetailsView(name: category.name))
                    } label: {
                        VStack {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(.yellow)
                                .frame(width: 68,height: 68)
                                .background(.white)
                                .cornerRadius(.infinity)
                                .shadow(color: .gray
                                        , radius: 4,x: 0.0,y: 2)
                            Text(category.name)
                                .font(.system(size: 12,weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 68)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


struct DiscoverCategories_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange
            DiscoverCategories()
        }
    }
}
