//
//  RequestManager.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit
class NetworkManager{
    func urlRequest<T: Decodable>(queryString:String,apiResource: APIResource,completion: @escaping (Result<T, Error>) -> ()){

       let queryUrl = queryString != "" ? apiResource.urlString + "/search?query=\(queryString)" : apiResource.urlString
//            let urlSrting = apiResource.urlString + "/search?query=\(queryString)"
//        }
        
        guard let url = URL(string: queryUrl) else { return}
        var request = URLRequest(url: url)
        request.addValue("563492ad6f917000010000014d81d4a591944e72a91369c34061eda0", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(result))
            } catch let err{
                completion(.failure(err))
            }
        }.resume()
    }
}
