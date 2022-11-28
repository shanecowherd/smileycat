//
//  CatRealmModel.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/27/22.
//

import RealmSwift

/// Realm Model for Cat object
class Cat: Object, Identifiable {
    @Persisted var _id: ObjectId
    @Persisted(primaryKey: true) var sourceId: String = ""
    @Persisted var sourceUrl: String = ""
    @Persisted var placeholderColorNumber: Int
    convenience init(sourceId: String, sourceUrl: String) {
        self.init()
        self.sourceId = sourceId
        self.sourceUrl = sourceUrl
        self.placeholderColorNumber = Int.random(in: 1...14)
    }
    
    var id: String {
        return self._id.stringValue
    }
}
