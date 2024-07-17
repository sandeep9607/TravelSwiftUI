//
//  TrendingCategoryViewModel.swift
//  TravelDiscovery
//
//  Created by iMac on 21/11/23.
//
import Foundation
import SwiftyJSON
import SwiftUI
import Alamofire

class TrendingCategoryViewModel : ObservableObject {
    
    @Published var isLoading = true
    @Published var userDetailResponse : UserDetailResponse?
    
    init(userId: Int) {
        let urlString = UrlEndPoint.getService(.user) + "\(userId)"
        AF.request(urlString).responseDecodable(of: UserDetailResponse.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.userDetailResponse = data
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
}
