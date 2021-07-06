//
//  BeerTableViewCell.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    static let cellId = "BeerTableViewCell"
    var beer: BeerModel = BeerModel()
    
    var beerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var beerResumeStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 16
        return stack
    }()
    
    var beerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    var beerAlcoholContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    

    
    func setupCell(with beer: BeerModel) {
        self.beer = beer
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        if let imageURL = beer.image {
           setupImage(imageURL: imageURL)
        }

        beerNameLabel.text = beer.name ?? String()
        if let alcoholContent = beer.abv {
            beerAlcoholContentLabel.text = "Teor alcoólico: \(alcoholContent) %"
        }
        
        contentView.addSubview(beerImage)
        contentView.addSubview(beerResumeStack)
        beerResumeStack.addArrangedSubview(beerNameLabel)
        beerResumeStack.addArrangedSubview(beerAlcoholContentLabel)

    }
    
    private func setupImage(imageURL: String) {
        let url = URL(string: imageURL) ?? URL(fileURLWithPath: imageURL)
        let data = try? Data(contentsOf: url)
        beerImage.image = UIImage(data: data ?? Data())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            beerImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            beerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            beerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            beerImage.heightAnchor.constraint(equalToConstant: 128),
            beerImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.1),
            
            beerResumeStack.leftAnchor.constraint(equalTo: beerImage.rightAnchor, constant: 16),
            beerResumeStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            beerResumeStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
           
            beerNameLabel.topAnchor.constraint(equalTo: beerResumeStack.topAnchor),
            beerNameLabel.leftAnchor.constraint(equalTo: beerResumeStack.leftAnchor),
            beerNameLabel.rightAnchor.constraint(equalTo: beerResumeStack.rightAnchor),
            
            beerAlcoholContentLabel.bottomAnchor.constraint(equalTo: beerResumeStack.bottomAnchor),
            beerAlcoholContentLabel.rightAnchor.constraint(equalTo: beerResumeStack.rightAnchor),
            beerAlcoholContentLabel.leftAnchor.constraint(equalTo: beerResumeStack.leftAnchor)
        ])
    }

}
