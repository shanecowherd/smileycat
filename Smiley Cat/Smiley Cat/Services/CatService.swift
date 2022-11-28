//
//  CatService.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/27/22.
//

import Foundation
import RealmSwift

@MainActor
class CatService: ObservableObject {
    let realm = try? Realm()
    
    init(skipDownloading: Bool = false) {
        
        /// Allow CatService to be initialized without downloading.
        guard !skipDownloading else {
            return
        }
        
        Task {
            do {
                try await download()
            } catch {
                debugPrint("Consider showing an alert popup, currently placeholder cats will be displayed.")
            }
        }
    }
    
    func download() async throws {
        
        /// Cataas.com API to grab the meta data for 16 gifs.
        let cataasApiUrl = URL(string: "https://cataas.com/api/cats?limit=16&skip=0&tags=gif")!
        
        /// Download the metadata for 16 gifs.
        let json = try await URLSession.shared.data(from: cataasApiUrl)
        let downloadedCats = try JSONDecoder().decode([CatNetworkResponse].self, from: json.0)
        
        /// Get all downloaded cats from Realm.
        let existingCats = all()
        
        /// Loop over all the downloaded cats, if we find a new cat, go ahead and add it to Realm.
        for cat in downloadedCats {
            let existingCat = existingCats.first { $0.sourceId == cat.id }
            
            if existingCat == nil {
                realm?.writeAsync({
                    let sourceUrl = "https://cataas.com/cat/\(cat.id)"
                    let newCat = Cat(sourceId: cat.id, sourceUrl: sourceUrl)
                    
                    debugPrint("🟢 Adding item to realm: \(cat.id)")
                    self.realm?.add(newCat)
                })
            }
        }
    }
    
    func all() -> Results<Cat> {
        let realm = try! Realm()
        return realm.objects(Cat.self)
    }
}
