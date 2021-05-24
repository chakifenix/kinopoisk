//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

protocol ViewInstallationProtocol {
    func setupViews()
    func addSubviews()
    func setViewConstraints()
    func stylizeViews()
}

extension ViewInstallationProtocol {
    func setupViews() {
        addSubviews()
        setViewConstraints()
        stylizeViews()
    }
}
