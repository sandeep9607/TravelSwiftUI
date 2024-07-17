//
//  Container.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import Foundation
import UIKit
import SwiftUI

struct DestinationHeaderContainer : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        return redVC
    }

    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
}
