//
//  BeerListViewSpy.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
@testable import Beer

class BeerListViewSpy: BeerListViewProtocol {
    var displayBeersCalled = false
    var displayErrorCalled = false
    var displayLoadingCalled = false
    var stopLoadingCalled = false
    
    var displayedBeers: [BeerModel] = []
    var displayedTitle = String()
    
    func displayBeers(with beers: [BeerModel], title: String) {
        displayBeersCalled = true
        displayedBeers = beers
        displayedTitle = title
    }
    
    func displayError() {
        displayErrorCalled = true
    }
    
    func displayLoading() {
        displayLoadingCalled = true
    }
    
    func stopLoading() {
        stopLoadingCalled = true
    }
    
    
}
