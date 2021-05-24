//
//  NavigationController.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, BaseViewControllerProtocol {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return activityIndicator
    }()
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = ""
        viewControllers.last?.navigationItem.backBarButtonItem = backBarButtonItem
        
        super.pushViewController(viewController, animated: animated)
    }
}
