//
//  ReservationDetailResponse.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:

import Foundation

// MARK: - ReservationDetailResponse
struct ReservationDetailResponse: Codable {
    let id: Int?
    let name, city, country, category: String?
    let description: String?
    let photos: [String]?
    let thumbnail: String?
    let popularDishes: [PopularDish]?
    let reviews: [Reviews]?
}

// MARK: - PopularDish
struct PopularDish: Codable , Hashable {
    let name, price: String?
    let numPhotos: Int?
    let photo: String?
}

// MARK: - Review
struct Reviews: Codable, Hashable {
    let user: Users?
    let rating: Int?
    let text: String?
}

// MARK: - User
struct Users: Codable , Hashable {
    let id: Int?
    let username, firstName, lastName: String?
    let profileImage: String?
    let followers, following: Int?
    let posts: [Post]?
}

// MARK: - Post
struct Post: Codable , Hashable {
    let title: String?
    let imageURL: String?
    let views: String?
    let hashtags: [String]?

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "imageUrl"
        case views, hashtags
    }
}

