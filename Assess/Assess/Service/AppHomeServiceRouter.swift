//
//  AppHomeServiceRouter.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation

enum AppHomeServiceRouter{
    case getPhotos
    case getVideos
    case getBannerData
}

extension AppHomeServiceRouter {
    var request: APIResource {
        switch  self {
        case .getPhotos:
            return APIResource(URLString: "https://api.pexels.com/v1", method: .get, parameters: [:], headers: ["Authorization": "563492ad6f917000010000014d81d4a591944e72a91369c34061eda0"], contentType: .json, formData: nil, responseKey: nil)
        case .getVideos:
            return APIResource(URLString: "https://api.pexels.com/videos", method: .get, parameters: [:], headers: ["Authorization": "563492ad6f917000010000014d81d4a591944e72a91369c34061eda0"], contentType: .json, formData: nil, responseKey: nil)
        case .getBannerData:
            return APIResource(URLString: "https://api.pexels.com/v1/curated", method: .get, parameters: [:], headers: ["Authorization": "563492ad6f917000010000014d81d4a591944e72a91369c34061eda0"], contentType: .json, formData: nil, responseKey: nil)
        }
    }
}

final class AppHomeService{
   
    func getImages(queryString:String,completion: @escaping(Photos) -> ()){
        NetworkManager().urlRequest(queryString: queryString, apiResource:AppHomeServiceRouter.getPhotos.request) { (response: Result<Photos, Error>) in
            switch response{
                
            case .success(let res):
                completion(res)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getVideos(queryString: String,completion: @escaping(Videos) -> ()){
        NetworkManager().urlRequest(queryString:queryString, apiResource:AppHomeServiceRouter.getVideos.request) { (response: Result<Videos, Error>) in
            switch response{
                
            case .success(let res):
                completion(res)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBannerData(queryString:String,completion: @escaping(BannerData) -> ()){
        NetworkManager().urlRequest(queryString: queryString, apiResource:AppHomeServiceRouter.getBannerData.request) { (response: Result<BannerData, Error>) in
            switch response{
                
            case .success(let res):
                completion(res)
            case .failure(let error):
                print(error)
            }
        }
    }
}

