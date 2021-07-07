//
//  BeerDetailPresenterSpy.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
@testable import Beer

class BeerDetailPresenterSpy: BeerDetailPresenterProtocol {
    var view: BeerDetailViewProtocol?
    
    var fetchBeerDetailCalled = false
    var selectedBeer = BeerModel()
    
    func fetchBeerDetail(with beer: BeerModel) {
        fetchBeerDetailCalled = true
        selectedBeer = beer
    }
}
