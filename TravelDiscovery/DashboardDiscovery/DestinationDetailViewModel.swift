//
//  DestinationDetailViewModel.swift
//  TravelDiscovery
//
//  Created by iMac on 10/11/23.
//

import Foundation
import SwiftyJSON

class DestinationDetailViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var destinationDetailRes: DestinationDetailResponse?
    
    init(name:String) {
        guard let url = URL(string: "\(UrlEndPoint.getService(.destinationName)+name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, resp, error) in
            DispatchQueue.main.async {
                guard let self = self, let data = data else {
                    return
                }
                
                print(JSON(data))
                
                do {
                    self.destinationDetailRes = try JSONDecoder().decode(DestinationDetailResponse.self, from: data)
                    self.isLoading = false
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}

