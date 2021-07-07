//
//  BeerDetailViewSpy.swift
//  BeerTests
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
import UIKit
@testable import Beer

class BeerDetailViewSpy: BeerDetailViewProtocol {
    var displayBeerDetailsCalled = false
    var displayedTitle = String()
    var displayedAlcoholContent = String()
    var displayedBitterness = String()
    
    func displayBeerDetails(with title: String, image: UIImage, alcoholContent: String, bitterness: String) {
        displayBeerDetailsCalled = true
        displayedTitle = title
        displayedAlcoholContent = alcoholContent
        displayedBitterness = bitterness
    }
    
    
}
