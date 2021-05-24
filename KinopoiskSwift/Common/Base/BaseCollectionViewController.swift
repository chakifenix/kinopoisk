//
//  BaseCollectionViewController.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController, BaseViewControllerProtocol {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
    }
}
