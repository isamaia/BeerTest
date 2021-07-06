//
//  BeerModel.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 05/07/21.
//

import Foundation

struct BeerResponse: Codable {
    var data: [BeerModel]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct BeerModel: Codable {
    var name: String?
    var image: String?
    var abv: Double?
    var tagline: String?
    var ibu: Double?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case name, abv, tagline, ibu, description
        case image = "image_url"
    }
}
