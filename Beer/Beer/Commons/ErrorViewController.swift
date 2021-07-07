//
//  ErrorViewController.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import UIKit

class ErrorViewController: BaseViewController {

    private var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Não foi possível carregar as informações"
        label.font = .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    override func setupView() {
        view.addSubview(errorLabel)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            errorLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
}
