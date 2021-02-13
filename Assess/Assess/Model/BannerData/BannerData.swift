//
//  BannerData.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
struct BannerData : Codable {
    let page : Int?
    let per_page : Int?
    let photos : [Photo]?
    let next_page : String?

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case per_page = "per_page"
        case photos = "photos"
        case next_page = "next_page"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
        photos = try values.decodeIfPresent([Photo].self, forKey: .photos)
        next_page = try values.decodeIfPresent(String.self, forKey: .next_page)
    }

}
