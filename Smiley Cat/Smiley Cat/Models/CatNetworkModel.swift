//
//  CatNetworkModel.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/27/22.
//

import Foundation

/// Response JSON from Cataas.com
struct CatNetworkResponse: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
}
