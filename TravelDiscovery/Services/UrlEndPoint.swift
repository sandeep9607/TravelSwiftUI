//
//  Services.swift
//  TravelDiscovery
//
//  Created by iMac on 01/01/24.
//

import Foundation

enum Endpoint : String {
    case categoryName
    case destinationName
    case restaurant
    case user
}

var baseUrl: String = "https://travel.letsbuildthatapp.com/travel_discovery/"
var amazonawsUrl: String = "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/"

class UrlEndPoint : NSObject {
    class func getService(_ endpoint : Endpoint) -> String{
        switch endpoint {
        case .categoryName:
            return baseUrl + "category?name="
        case .destinationName:
            return baseUrl + "destination?name="
        case .restaurant:
            return baseUrl + "restaurant?id=0"
        case .user:
            return baseUrl + "user?id="
        }
    }
    
    // mark : Url
    static let amazona41Url = amazonawsUrl + "a41cf22c-578d-456f-b0c4-90d5c017eab1"
    static let amazona28Url = amazonawsUrl + "288b811b-048c-4427-a875-2edc65c23d76"
    static let amazona4aUrl = amazonawsUrl + "4aff5261-6cea-49ad-a541-cb70b7f13ed3"
    static let amazona78Url = amazonawsUrl + "781069ca-2f84-46b9-8597-abaa8344f574"
    static let amazona98Url = amazonawsUrl + "985e75ec-8f3e-44ff-bf13-a597ed3f0f6e"
    static let amazona5993Url = amazonawsUrl + "e2f3f5d4-5993-4536-9d8d-b505d7986a5c"
    static let amazona4c79Url = amazonawsUrl + "a4d85eff-4c79-4141-a0d6-761cca48eae1"
    static let amazona3de7Url = amazonawsUrl + "20a6783b-3de7-4e58-9e22-bcc6a43b6df6"
    static let amazona2f10Url = amazonawsUrl + "0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2"
    static let amazona44e5Url = amazonawsUrl + "3923d237-3931-44e5-836f-5de40ec04b31"
    static let amazona4a2bUrl = amazonawsUrl + "254c0418-2b55-4a2b-b530-a31a9799c7d5"
    static let amazona4df9Url = amazonawsUrl + "fa20d064-b6d7-4df9-8f44-0f25f6ee5a19"
    static let amazona4444Url = amazonawsUrl + "a441d22b-5324-4444-8ddf-22b99128838c"
    static let amazona4e5eUrl = amazonawsUrl + "6b5d013b-dc3b-4e5e-93d9-ec932f42aead"
    static let amazona4674Url = amazonawsUrl + "a6de1d65-8fa3-4674-a6ce-a207b8f86b15"
    static let amazona42acUrl = amazonawsUrl + "5c6bc68c-a8a1-42ac-ab3a-947927826807"
    static let amazona4129Url = amazonawsUrl + "a5e83c0c-c815-4129-bfd4-17e73fa1da78"
    static let amazona42c1Url = amazonawsUrl + "f6ee5fb7-b21b-42c1-b1d8-a455742d0247"
    static let amazona4559Url = amazonawsUrl + "c22e8d9e-10f2-4559-8c81-375491295e84"
    static let amazona4fa7Url = amazonawsUrl + "3a352f87-3dc1-4fa7-affe-fb12fa8691fe"
    static let amazona4043Url = amazonawsUrl + "8ca76521-1f52-4043-8b86-d2a573342daf"
    static let amazona46acUrl = amazonawsUrl + "73f69749-f986-46ac-9b8b-d7b1d42bddc5"
}

