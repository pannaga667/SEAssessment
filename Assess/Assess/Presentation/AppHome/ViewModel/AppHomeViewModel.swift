//
//  AppHomeViewModel.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
import UIKit

class AppHomeViewModel{
    var photos: Binder<Photos?> = Binder(nil)
    var videos: Binder<Videos?> = Binder(nil)
    var bannerData: Binder<BannerData?> = Binder(nil)
    lazy var appHomeService = AppHomeService()
    
    init() {
    }
    
    func getPhotos(queryString:String){
        appHomeService.getImages(queryString: queryString, completion: { [weak self] results in
            print(results)
            self?.photos.value = results
        })
        
    }
}

