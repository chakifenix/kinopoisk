//
//  SectionHeaderView.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView, ReusableView {
    
    private let topSeperatorView = UIView()
    private let titleLabel = UILabel()
    private let rightButton = UIButton()
    private let bottomSeperatorView = UIView()
    
    var performOnRightButtonTap: (() -> Void)?
    
    func set(title: String) {
        titleLabel.text = title
    }
    
    func setRightButton(iconImage: UIImage, rightButtonTapAction: @escaping () -> Void) {
        rightButton.setImage(iconImage, for: .normal)
        performOnRightButtonTap = rightButtonTapAction
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        rightButton.setImage(nil, for: .normal)
        performOnRightButtonTap = nil
    }
    
    @objc private func rightButtonAction() {
        performOnRightButtonTap?()
    }
}

extension SectionHeaderView: ViewInstallationProtocol {
    func addSubviews() {
        addSubview(topSeperatorView)
        addSubview(titleLabel)
        addSubview(rightButton)
        addSubview(bottomSeperatorView)
    }
    
    func setViewConstraints() {
        topSeperatorView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, heightConstant: 0.3)
        
        var layoutConstraints = [NSLayoutConstraint]()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            rightButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            rightButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
        
        bottomSeperatorView.anchor(left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, heightConstant: 0.3)
    }
    
    func stylizeViews() {
        contentView.backgroundColor = AppColor.lightGray.uiColor
        
        topSeperatorView.backgroundColor = .lightGray
        
        titleLabel.textColor = AppColor.darkGray.uiColor
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        
        rightButton.contentMode = .scaleAspectFit
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
    }
}
