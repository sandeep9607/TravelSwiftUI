//
//  CorouselPageViewController.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//

import Foundation
import UIKit
import SwiftUI
import Kingfisher


class CorouselPageViewController : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var allViewController : [UIViewController] = []
    var selectedIndex : Int
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        allViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        self.selectedIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == 0 {return nil}
        
        return allViewController[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allViewController.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == allViewController.count - 1 {return nil}
        
        return allViewController[index + 1]
    }
    
    
    
    init(imageUrl: [String], selectedIndex : Int) {
        self.selectedIndex = selectedIndex
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray5
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal,options: nil)
        
        allViewController = imageUrl.map({ imageName in
            let hostingVC =
            UIHostingController(rootView:
                                    ZStack {
                Color.black
                KFImage(URL(string: imageName))
                    .resizable()
                    .scaledToFit()
            })
            hostingVC.view.clipsToBounds = true
            return hostingVC
        })
        
        if selectedIndex < allViewController.count {
            
            setViewControllers([allViewController[selectedIndex]], direction: .forward, animated: true,completion: nil)
            
        }
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(order:) has not been implemented")
    }
}

