//
//  CategoryDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by iMac on 08/11/23.
//

import Foundation
import SwiftyJSON

class CategoryDetailsViewModel : ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var isError = ""
    
    init(name: String) {
        
        let url =  UrlEndPoint.getService(.categoryName) + name.lowercased()
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: url) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                   statusCode >= 400 {
                    self.isLoading = false
                    self.isError = "Bad status : \(statusCode)"
                    return
                }
                
                guard let data  = data else {return}
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    self.isError = error.localizedDescription
                }
                self.isLoading = false
            }
        }
        .resume()
    }
}
