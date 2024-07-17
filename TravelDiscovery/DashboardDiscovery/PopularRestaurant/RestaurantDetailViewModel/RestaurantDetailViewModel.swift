//
//  RestaurantDetailViewModel.swift
//  TravelDiscovery
//
//  Created by iMac on 20/11/23.
//

import Foundation
import SwiftyJSON
import SwiftUI
import Alamofire

class RestaurantDetailViewModel : ObservableObject {
    
    @Published var isLoading = true
    @Published var reservationDetailRes : ReservationDetailResponse?
    
    init() {
        
        let urlString = UrlEndPoint.getService(.restaurant)
        AF.request(urlString).responseDecodable(of: ReservationDetailResponse.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.reservationDetailRes = data
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
}
