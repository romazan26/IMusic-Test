//
//  NetWorkManager.swift
//  IMusic Test
//
//  Created by Роман on 01.03.2024.
//

import UIKit
import Alamofire

final class NetWorkManager {
    
    func fetchTracks(searchText: String, completion: @escaping(SearchRespone?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term":"\(searchText)",
                          "limit":"10", "media": "music"]
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchRespone.self, from: data)
                completion(objects)
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
    
}
