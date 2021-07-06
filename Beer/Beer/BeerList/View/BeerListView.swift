//
//  BeerListView.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 05/07/21.
//

import UIKit

protocol BeerListViewProtocol: AnyObject {
    func displayBeers(with beers: [BeerModel], title: String)
    func displayError()
    func displayLoading()
    func stopLoading()
}

class BeerListView: BaseViewController, BeerListViewProtocol {

    var presenter: BeerListPresenterProtocol?
    var beers: [BeerModel] = []
    
    private var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()

    private var beerTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        BeerRouter.goToBeerList(view: self)
    }
    
    func displayBeers(with beers: [BeerModel], title: String) {
        self.beers = beers
        self.title = title
        beerTableView.reloadData()
    }
    
    func displayLoading() {
        loadingView.isHidden = false
        loadingView.startAnimating()
    }
    
    func stopLoading() {
        self.navigationController?.isNavigationBarHidden = false
        loadingView.isHidden = true
        loadingView.stopAnimating()
    }
    
    func displayError() {
        BeerRouter.goToError(from: self)
    }
    
    override func setupView() {
        beerTableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.cellId)
        beerTableView.dataSource = self
        beerTableView.delegate = self
        
        self.view.addSubview(beerTableView)
        self.view.addSubview(loadingView)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            beerTableView.topAnchor.constraint(equalTo: view.topAnchor),
            beerTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            beerTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            beerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension BeerListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.cellId,
                                                 for: indexPath) as? BeerTableViewCell
        
        cell?.setupCell(with: beers[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showBeerDetail(with: beers[indexPath.row], from: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
