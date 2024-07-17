//
//  Container.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import Foundation
import SwiftUI

struct DestinationHeaderContainer : UIViewControllerRepresentable {
    @ObservedObject var vm = DestinationDetailViewModel(name: Constant.paris)
    let imageNames : [String]
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPageViewController(imageUrl: imageNames)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
}

struct DestinationHeaderContainer_Previews : PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer(imageNames: [""])
    }
}
