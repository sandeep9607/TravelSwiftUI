//
//  DestinationDetailResponse.swift
//  TravelDiscovery
//
//  Created by iMac on 10/11/23.

import Foundation

// MARK: - DestinationDetailResponse
//struct DestinationDetailResponse: Codable {
//    let id: Int?
//    let name, country, description: String?
//    let thumbnail: String?
//    let photos: [String]?
//    let related: [[DestinationDetailRes]]?
//    let latitude, longitude: Double?
//}
//
//// MARK: - Related
//struct DestinationDetailRes: Codable {
//    let name, country: String?
//    let thumbnail: String?
//}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let destinationDetailResponse = try? JSONDecoder().decode(DestinationDetailResponse.self, from: jsonData)

import Foundation

// MARK: - DestinationDetailResponse
struct DestinationDetailResponse: Codable {
    let related: [[DestinationDetailRes]]?
    let photos: [String]?
    let description, name: String?
    let latitude: Double?
    let id: Int?
    let thumbnail: String?
    let longitude: Double?
    let country: String?
}

// MARK: - Related
struct DestinationDetailRes: Codable {
    let thumbnail: String?
    let country, name: String?
}
