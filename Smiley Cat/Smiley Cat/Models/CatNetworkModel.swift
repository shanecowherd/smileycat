//
//  Cat.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/27/22.
//

import Foundation

//   let cats = try? JSONDecoder().decode(Cats.self, from: jsonData)

// MARK: - Cat
struct Cat: Codable {
    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
}

typealias Cats = [Cat]
