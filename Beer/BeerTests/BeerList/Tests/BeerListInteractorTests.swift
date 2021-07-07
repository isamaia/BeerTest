//
//  BeerListInteractorTests.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import XCTest
@testable import Beer

class BeerListInteractorTests: XCTestCase {

    var interactor: BeerListInteractor!
    var presenterSpy: BeerListPresenterSpy!

    override func setUp() {
        interactor = BeerListInteractor()
        presenterSpy = BeerListPresenterSpy()
        interactor.presenter = presenterSpy
    }

    override func tearDown() {
        interactor = nil
        presenterSpy = nil
    }

    func testFetchBeerListSuccess() {
        let service = BeerServiceSuccessMock()
        interactor.service = service
        interactor.fetchBeerList()
        
        XCTAssert(presenterSpy.showLoadingCalled)
        XCTAssert(presenterSpy.hideLoadingCalled)
        XCTAssert(presenterSpy.showBeerListCalled)
        XCTAssertEqual(presenterSpy.displayedBeers.count, 2)
    }

    func testFetchBeerListFailure() throws {
        let service = BeerServiceFailureMock()
        interactor.service = service
        interactor.fetchBeerList()
        
        XCTAssert(presenterSpy.showLoadingCalled)
        XCTAssert(presenterSpy.hideLoadingCalled)
        XCTAssert(presenterSpy.showErrorCalled)
    }

}
