//
//  Video.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import Foundation
struct Video : Codable {
    let id : Int?
    let width : Int?
    let height : Int?
    let url : String?
    let image : String?
    let duration : Int?
    let user : User?
    let videoFiles : [VideoFiles]?
    let videoPictures : [VideoPictures]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case width = "width"
        case height = "height"
        case url = "url"
        case image = "image"
        case duration = "duration"
        case user = "user"
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        duration = try values.decodeIfPresent(Int.self, forKey: .duration)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        videoFiles = try values.decodeIfPresent([VideoFiles].self, forKey: .videoFiles)
        videoPictures = try values.decodeIfPresent([VideoPictures].self, forKey: .videoPictures)
    }

}

