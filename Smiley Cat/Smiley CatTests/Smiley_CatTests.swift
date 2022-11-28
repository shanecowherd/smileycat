//
//  Smiley_CatTests.swift
//  Smiley CatTests
//
//  Created by Shane Cowherd on 11/27/22.
//

import XCTest
@testable import Cat_Popper

final class Cat_PopperTests: XCTestCase {

    override func setUpWithError() throws {
        //Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }

    func testDownloadCatsFromCataas() async throws {
        
        // Ran into some trouble getting Realm to play nicely with XCTest when it is installed via a SPM.
        // It appears to be a known issue: https://github.com/realm/realm-swift/issues/7992
        // Disabling the test for now.
        
        
//        let catService = CatService(skipDownloading: true)
//        let currentCatCount = catService.all().count
//        assert(currentCatCount == 0)
//        await catService.download()
//        assert(currentCatCount > 0)
    }

}
