//
//  BeerListInteractorSpy.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
@testable import Beer

class BeerListInteractorSpy: BeerListInteractorProtocol {
    var fetchBeerListCalled = false

    var presenter: BeerListPresenterProtocol?
    var service: BeerListServiceProtocol?
    
    func fetchBeerList() {
        fetchBeerListCalled = true
    }
    
    
}
