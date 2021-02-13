//
//  Videos.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
struct Videos : Codable {
    let page : Int?
    let per_page : Int?
    let total_results : Int?
    let url : String?
    let videos : [Video]?

    enum CodingKeys: String, CodingKey {

        case page = "page"
        case per_page = "per_page"
        case total_results = "total_results"
        case url = "url"
        case videos = "videos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        videos = try values.decodeIfPresent([Video].self, forKey: .videos)
    }

}

