//
//  BeerListPresenterTests.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import XCTest
@testable import Beer

class BeerListPresenterTests: XCTestCase {
    
    var presenter: BeerListPresenter!
    var viewSpy: BeerListViewSpy!
    var interactorSpy: BeerListInteractorSpy!

    override func setUp() {
        presenter = BeerListPresenter()
        viewSpy = BeerListViewSpy()
        interactorSpy = BeerListInteractorSpy()
        presenter.interactor = interactorSpy
        presenter.view = viewSpy
    }

    override func tearDown() {
        presenter = nil
        viewSpy = nil
        interactorSpy = nil
    }

    func testFetchBeerList() {
        presenter.fetchBeerList()
        
        XCTAssert(interactorSpy.fetchBeerListCalled)
    }
    
    func testShowBeerList() {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        presenter.showBeerList(with: beerModel)
        
        XCTAssert(viewSpy.displayBeersCalled)
        XCTAssertEqual(viewSpy.displayedBeers.count, 2)
    }
    
    func testShowLoading() {
        presenter.showLoading()
        
        XCTAssert(viewSpy.displayLoadingCalled)
    }
    
    func testHideLoading() {
        presenter.hideLoading()
        
        XCTAssert(viewSpy.stopLoadingCalled)
    }
    
    func testShowError() {
        presenter.showError()
        
        XCTAssert(viewSpy.displayErrorCalled)
    }

}
