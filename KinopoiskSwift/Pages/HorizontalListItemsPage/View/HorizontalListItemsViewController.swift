//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class HorizontalListItemsViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var models = [TmdbModel]()
    
    func set(models: [TmdbModel]) {
        self.models = models
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylizeViews()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HorizontalListItemCVCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.set(model: models[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HorizontalListItemsTVCell.getCellWidth(), height: HorizontalListItemsTVCell.getCellHeight())
    }
}

extension HorizontalListItemsViewController {
    private func  stylizeViews() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(cell: HorizontalListItemCVCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}
