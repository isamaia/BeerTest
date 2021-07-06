//
//  BeerDetailViewController.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import UIKit

protocol BeerDetailViewProtocol: AnyObject {
    func displayBeerDetails(with title: String, image: UIImage, alcoholContent: String, bitterness: String)
}

class BeerDetailViewController: BaseViewController, BeerDetailViewProtocol {
    
    var beer: BeerModel
    
    private var beerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var beerDetailStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    private var beerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Nome:"
        return label
    }()
    
    private var beerNameValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    private var beerTaglineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Tagline:"
        return label
    }()
    
    private var beerTaglineValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    private var beerAlcoholContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Teor Alcoolico:"
        return label
    }()
    
    private var beerAlcoholContentValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()

    private var beerBitternessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Amargor:"
        return label
    }()
    
    private var beerBitternessValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()

    private var beerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Descrição:"
        return label
    }()
    
    private var beerDescriptionValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()

    init(beer: BeerModel) {
        self.beer = beer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func displayBeerDetails(with title: String, image: UIImage, alcoholContent: String, bitterness: String) {
        self.title = title
        beerImage.image = image
        
        beerNameValue.text = beer.name
        beerTaglineValue.text = beer.tagline
        beerAlcoholContentValue.text = alcoholContent
        beerBitternessValue.text = bitterness
        beerDescriptionValue.text = beer.description
    }
    
    override func setupView() {
        view.addSubview(beerImage)
        view.addSubview(beerDetailStack)
        beerDetailStack.addArrangedSubview(beerNameLabel)
        beerDetailStack.addArrangedSubview(beerNameValue)
        beerDetailStack.addArrangedSubview(beerTaglineLabel)
        beerDetailStack.addArrangedSubview(beerTaglineValue)
        beerDetailStack.addArrangedSubview(beerAlcoholContentLabel)
        beerDetailStack.addArrangedSubview(beerAlcoholContentValue)
        beerDetailStack.addArrangedSubview(beerBitternessLabel)
        beerDetailStack.addArrangedSubview(beerBitternessValue)
        beerDetailStack.addArrangedSubview(beerDescriptionLabel)
        beerDetailStack.addArrangedSubview(beerDescriptionValue)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            beerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            beerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            beerImage.heightAnchor.constraint(equalToConstant: 128),
            beerImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.1),
            
            beerDetailStack.topAnchor.constraint(equalTo: beerImage.bottomAnchor, constant: 16),
            beerDetailStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            beerDetailStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)        ])
    }

}
