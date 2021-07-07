//
//  BeerListViewTests.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import XCTest
@testable import Beer

class BeerListViewTests: XCTestCase {
    
    var viewController: BeerListView!
    var presenterSpy: BeerListPresenterSpy!
    var window: UIWindow!

    override func setUp() {
        viewController = BeerListView()
        presenterSpy = BeerListPresenterSpy()
        viewController.presenter = presenterSpy
        loadView()
    }

    override func tearDown() {
        viewController = nil
        presenterSpy = nil
        window = nil
    }

    func loadView() {
        window = UIWindow()
        viewController.view = window
    }
    
    func testViewDidLoad() {
        viewController.viewDidLoad()
        
        if let navBar = viewController.navigationController {
            XCTAssert(navBar.isNavigationBarHidden)
        }
    }

    func testDisplayBeers() {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        let title = "lista de cervejas"
        
        viewController.displayBeers(with: beerModel, title: title)
        
        XCTAssertEqual(viewController.title, title)
        XCTAssertEqual(viewController.beers.count, 2)
    }
    
    func testDisplayLoading() {
        viewController.displayLoading()
        
        XCTAssert(viewController.loadingView.isAnimating)
        XCTAssertFalse(viewController.loadingView.isHidden)
    }
    
    func testStopLoading() {
        viewController.stopLoading()
        
        XCTAssertFalse(viewController.loadingView.isAnimating)
        XCTAssert(viewController.loadingView.isHidden)
        if let navbar = viewController.navigationController {
            XCTAssertFalse(navbar.isNavigationBarHidden)
        }
    }
    
    func testSetupView() {
        viewController.setupView()
        
        XCTAssertEqual(viewController.view.subviews.count, 2)
    }

    func testNumberOfRowsInSection() {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        
        viewController.displayBeers(with: beerModel, title: "")
        let numberOfRows = viewController.tableView(viewController.beerTableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 2)
    }
    
    func testCellForRowAt() {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        
        viewController.setupView()
        viewController.displayBeers(with: beerModel, title: "")
        let index = IndexPath(row: 0, section: 0)
        let cell = viewController.tableView(viewController.beerTableView, cellForRowAt: index)
        
        XCTAssertNotNil(cell)
    }
    
    func testDidSelectAtRow() {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        
        viewController.setupView()
        viewController.displayBeers(with: beerModel, title: "")
        let index = IndexPath(row: 0, section: 0)
        viewController.tableView(viewController.beerTableView, didSelectRowAt: index)
        
        XCTAssert(presenterSpy.showBeerDetailCalled)
        XCTAssertEqual(presenterSpy.selectedBeer.name, beerModel[0].name)
    }
    
    func testHeightForRow() {
        let beer = BeerModel(name: "teste1", image: "img1", abv: 0.9, tagline: "tag1", ibu: 1.2, description: "desc1")
        let beerModel = [beer, beer]
        
        viewController.setupView()
        viewController.displayBeers(with: beerModel, title: "")
        let index = IndexPath(row: 0, section: 0)
        let height = viewController.tableView(viewController.beerTableView, heightForRowAt: index)
        
        XCTAssertEqual(height, 160)
    }
}
