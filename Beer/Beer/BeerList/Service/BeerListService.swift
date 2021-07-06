//
//  BeerListService.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import Foundation
import Alamofire

protocol BeerListServiceProtocol: AnyObject {
    typealias FetchSuccess = (([BeerModel]) -> Void)
    typealias FetchFailure = ((Error) -> Void)
    
    func fetchBeerList(success: @escaping FetchSuccess, failure: @escaping FetchFailure)
}

class BeerListService: BeerListServiceProtocol {
    let endPoint = "https://api.punkapi.com/v2/beers"
    
    func fetchBeerList(success: @escaping FetchSuccess, failure: @escaping FetchFailure) {
        Alamofire.request(endPoint,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.prettyPrinted).responseJSON { response in
              if let json = response.result.value {
                success(self.decodeJSON(json: json))
              }
          }
    }
    
    func decodeJSON(json: Any) -> [BeerModel] {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let beerItems = try JSONDecoder().decode([BeerModel].self, from: jsonData)
            return beerItems
        } catch {
            print("deu ruim")
        }
        return []
    }
}
