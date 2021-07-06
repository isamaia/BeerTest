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
        setupNavigationController()
        view.backgroundColor = .white
    }
    
    private func setupNavigationController() {
        self.navigationController?.navigationItem.backButtonDisplayMode = .minimal
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func setupView() {
        // to be overrided
    }
    
    func setupConstraint() {
        // to be overrided
    }

}
