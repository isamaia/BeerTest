//
//  BeerListPresenter.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 05/07/21.
//

import Foundation
import UIKit

protocol BeerListPresenterProtocol: AnyObject {
    var interactor: BeerListInteractorProtocol? { get set }
    var view: BeerListViewProtocol? { get set }

    func fetchBeerList()
    func showBeerList(with beers: [BeerModel])
    func showLoading()
    func hideLoading()
    func showError()
    func showBeerDetail(with beer: BeerModel, from view: UIViewController)
}

class BeerListPresenter: BeerListPresenterProtocol {

    weak var view: BeerListViewProtocol?
    var interactor: BeerListInteractorProtocol?
    
    func fetchBeerList() {
        interactor?.fetchBeerList()
    }
    
    func showBeerList(with beers: [BeerModel]) {
        view?.displayBeers(with: beers, title: "Lista de cervejas")
    }

    func showBeerDetail(with beer: BeerModel, from view: UIViewController) {
        BeerRouter.goToBeerDetail(with: beer, from: view)
    }
    
    func showLoading() {
        view?.displayLoading()
    }
    
    func hideLoading() {
        view?.stopLoading()
    }
    
    func showError() {
        view?.displayError()
    }
}
