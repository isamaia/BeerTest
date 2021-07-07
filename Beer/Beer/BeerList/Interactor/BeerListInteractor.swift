//
//  BeerListInteractor.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 05/07/21.
//

import Foundation
import Alamofire

protocol BeerListInteractorProtocol: AnyObject {
    var presenter: BeerListPresenterProtocol? { get set }
    var service: BeerListServiceProtocol? { get set }
    func fetchBeerList()
}

class BeerListInteractor: BeerListInteractorProtocol {
    
    weak var presenter: BeerListPresenterProtocol?
    var service: BeerListServiceProtocol?
    
    func fetchBeerList() {
        presenter?.showLoading()
        service?.fetchBeerList { response in
            self.presenter?.hideLoading()
            self.presenter?.showBeerList(with: response)
        } failure: { error in
            self.presenter?.hideLoading()
            self.presenter?.showError()
        }
    }
}
