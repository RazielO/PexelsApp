//
//  Models.swift
//  PexelsApp
//
//  Created by Raziel on 5/8/20.
//  Copyright © 2020 Raziel. All rights reserved.
//

import SwiftUI
import Foundation

struct Photos: Codable, Identifiable {
    var id: Int?
    
    var page: Int
    var perPage: Int
    var totalResults: Int?
    var url: String?
    var nextPage: String?
    var photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url
        case nextPage = "next_page"
        case photos
    }
}

struct Photo: Codable, Identifiable {
    var id: Int?
    
    var width, height: Int
    var url: String
    var photographer: String
    var src: Src
}

struct Src: Codable, Identifiable {
    var id: Int?
    
    var original, large, large2X, medium: String
    var small, portrait, landscape, tiny: String

    enum CodingKeys: String, CodingKey {
        case original, large
        case large2X = "large2x"
        case medium, small, portrait, landscape, tiny
    }
}
