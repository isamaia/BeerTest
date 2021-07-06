//
//  BaseViewController.swift
//  Beer
//
//  Created by Isabella Maia Bitencourt on 06/07/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
        view.backgroundColor = .white
    }
    
    func setupView() {
        // to be overrided
    }
    
    func setupConstraint() {
        // to be overrided
    }

}
