//
//  BeerRouter.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 05/07/21.
//

import Foundation
import UIKit

protocol BeerRouterProtocol: AnyObject {
    static func goToBeerDetail(with beer: BeerModel,from view: UIViewController)
    static func goToBeerList(view: BeerListView)
    static func goToError(from view: UIViewController)
}

class BeerRouter: BeerRouterProtocol {
    
    static func goToBeerDetail(with beer: BeerModel, from view: UIViewController) {
        let presenter: BeerDetailPresenterProtocol = BeerDetailPresenter()
        let viewController = BeerDetailViewController(beer: beer)
        
        presenter.view = viewController
        presenter.fetchBeerDetail(with: beer)
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
    static func goToError(from view: UIViewController) {
        let viewController = ErrorViewController()
        view.navigationController?.pushViewController(viewController, animated: true)
    }
    
    static func goToBeerList(view: BeerListView) {
        let presenter: BeerListPresenterProtocol = BeerListPresenter()

        view.presenter = presenter
        view.presenter?.view = view
        view.presenter?.interactor = BeerListInteractor()
        view.presenter?.interactor?.presenter = presenter
        view.presenter?.interactor?.service = BeerListService()
        presenter.fetchBeerList()
    }
    
}
