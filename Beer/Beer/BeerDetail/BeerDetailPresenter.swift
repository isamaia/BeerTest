//
//  BeerDetailPresenter.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import UIKit

protocol BeerDetailPresenterProtocol: AnyObject {
    var view: BeerDetailViewProtocol? { get set }

    func fetchBeerDetail(with beer: BeerModel)
}

class BeerDetailPresenter: BeerDetailPresenterProtocol {
    weak var view: BeerDetailViewProtocol?
    
    func fetchBeerDetail(with beer: BeerModel) {
        let image = configImage(with: beer.image ?? String())
        let alcoholContent = "\(beer.abv ?? Double()) %"
        let bitterness = "\(beer.ibu ?? Double()) %"
        view?.displayBeerDetails(with: beer.name ?? String(),
                                 image: image,
                                 alcoholContent: alcoholContent,
                                 bitterness: bitterness)
    }
    
    private func configImage(with imageURL: String) -> UIImage{
        let url = URL(string: imageURL) ?? URL(fileURLWithPath: imageURL)
        let data = try? Data(contentsOf: url)
        return UIImage(data: data ?? Data()) ?? UIImage()
    }
}
