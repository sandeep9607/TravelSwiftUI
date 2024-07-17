//
//  RestaurantCarouselView.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//

import Foundation
import SwiftUI

struct RestaurantCarouselView : UIViewControllerRepresentable {
    @ObservedObject var vm = DestinationDetailViewModel(name: "paris")
    let imageNames : [String]
    let selectedIndex : Int
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CorouselPageViewController(imageUrl: imageNames, selectedIndex: selectedIndex)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
}

struct RestaurantCarouselViewContainer_Previews : PreviewProvider {
    static var previews: some View {
        RestaurantCarouselView(imageNames: [""], selectedIndex: 5)
    }
}
