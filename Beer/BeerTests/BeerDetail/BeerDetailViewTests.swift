//
//  BeerDetailViewTests.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import XCTest
@testable import Beer

class BeerDetailViewTests: XCTestCase {
    
    var viewController: BeerDetailViewController!
    var window: UIWindow!
    let beer = BeerModel(name: "Teste1", image: "imagem1", abv: 1.0, tagline: "tag", ibu: 1.9, description: "desc")

    override func setUp() {
        viewController = BeerDetailViewController(beer: beer)
        loadView()
    }

    override func tearDown() {
        viewController = nil
        window = nil
    }

    func loadView() {
        window = UIWindow()
        viewController.view = window
    }

    func testDisplayBeerDetails() {
        viewController.displayBeerDetails(with: "Teste1", image: UIImage(), alcoholContent: "1.0 %", bitterness: "1.9 %")
        
        XCTAssertEqual(viewController.title, beer.name)
    }
    
    func testViewDidLoad() {
        viewController.viewDidLoad()
        
        XCTAssertEqual(viewController.view.subviews.count, 2)
        XCTAssertEqual(viewController.view.subviews[1].subviews.count, 10)
    }

}
