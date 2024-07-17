//
//  Attraction.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import Foundation

struct Attraction : Identifiable {
    let id = UUID().uuidString
    let name , imageName : String
    let latitude , longitude : Double
}
