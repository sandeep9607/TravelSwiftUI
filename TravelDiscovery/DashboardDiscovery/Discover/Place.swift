//
//  Place.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import Foundation


// MARK: - PlaceElement
struct Place: Codable , Hashable {
    let name, country, description: String?
    let thumbnail: String?
}

