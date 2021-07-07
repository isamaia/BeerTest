//
//  BeerListPresenterSpy.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
import UIKit
@testable import Beer

class BeerListPresenterSpy: BeerListPresenterProtocol {
    var fetchBeerListCalled = false
    var showBeerListCalled = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showErrorCalled = false
    var showBeerDetailCalled = false
    
    var displayedBeers: [BeerModel] = []
    var selectedBeer: BeerModel = BeerModel()
    
    var interactor: BeerListInteractorProtocol?
    
    var view: BeerListViewProtocol?
    
    func fetchBeerList() {
        fetchBeerListCalled = true
    }
    
    func showBeerList(with beers: [BeerModel]) {
        showBeerListCalled = true
        displayedBeers = beers
    }
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func showError() {
        showErrorCalled = true
    }
    
    func showBeerDetail(with beer: BeerModel, from view: UIViewController) {
        showBeerDetailCalled = true
        selectedBeer = beer
    }
}
