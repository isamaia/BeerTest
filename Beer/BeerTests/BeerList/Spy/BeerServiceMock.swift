//
//  BeerServiceMock.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
@testable import Beer

class BeerServiceSuccessMock: BeerListServiceProtocol {
    var fetchBeerSuccesCalled = false
    
    func fetchBeerList(success: @escaping FetchSuccess, failure: @escaping FetchFailure) {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        success(beerModel)
        fetchBeerSuccesCalled = true
    }
}

class BeerServiceFailureMock: BeerListServiceProtocol {
    var fetchBeerFailureCalled = false
    
    func fetchBeerList(success: @escaping FetchSuccess, failure: @escaping FetchFailure) {
        failure(DefaulfError())
        fetchBeerFailureCalled = true
    }
}

fileprivate struct DefaulfError: Error {
    
}
