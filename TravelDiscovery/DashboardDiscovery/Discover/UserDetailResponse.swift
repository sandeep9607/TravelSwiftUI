//
//  UserDetailResponse.swift
//  TravelDiscovery
//
//  Created by iMac on 21/11/23.

import Foundation

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable {
    let id: Int?
    let username, firstName, lastName: String?
    let profileImage: String?
    let followers, following: Int?
    let posts: [Post]?
}


