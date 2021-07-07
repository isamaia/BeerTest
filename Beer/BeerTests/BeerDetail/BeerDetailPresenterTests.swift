//
//  BeerDetailPresenterTests.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import XCTest
@testable import Beer

class BeerDetailPresenterTests: XCTestCase {

    var presenter: BeerDetailPresenter!
    var viewSpy: BeerDetailViewSpy!
    let beer = BeerModel(name: "Teste1", image: "imagem1", abv: 1.0, tagline: "tag", ibu: 1.9, description: "desc")

    override func setUp() {
        presenter = BeerDetailPresenter()
        viewSpy = BeerDetailViewSpy()
        presenter.view = viewSpy
    }

    override func tearDown() {
        presenter = nil
        viewSpy = nil
    }

    func testFetchBeerDetail() {
        let alcoholContent = "\(beer.abv ?? Double()) %"
        let bitterness = "\(beer.ibu ?? Double()) %"
        
        presenter.fetchBeerDetail(with: beer)
        
        XCTAssert(viewSpy.displayBeerDetailsCalled)
        XCTAssertEqual(viewSpy.displayedAlcoholContent, alcoholContent)
        XCTAssertEqual(viewSpy.displayedBitterness, bitterness)
        XCTAssertEqual(viewSpy.displayedTitle, beer.name)
       
    }

}
