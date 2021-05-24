//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class MainPageHeaderViewController: BaseViewController {
    
    let verticalStackView = UIStackView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: HorizontalCVLayout())
    let pageControl = PageControl()
    let typesView = MainPageHeaderTypesView()
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func set(movies: [Movie]) {
        self.movies = movies
        pageControl.numberOfPages = movies.count
        pageControl.layoutIfNeeded()
        collectionView.reloadData()
    }
}

extension MainPageHeaderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UpcomingMovieCVCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.set(movie: movies[indexPath.row])
        return cell
    }
}

extension MainPageHeaderViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: route to detail page
    }
}

extension MainPageHeaderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widht = screenSize.width
        let height = UpcomingMovieCVCell.getHeight()
        return CGSize(width: widht, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left * 2)
        let index = scrollView.contentOffset.x / witdh
        pageControl.currentPage = Int(round(index))
    }
}

extension MainPageHeaderViewController: ViewInstallationProtocol {
    func addSubviews() {
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(collectionView)
        verticalStackView.addArrangedSubview(pageControl)
        verticalStackView.addArrangedSubview(SpacerView(space: 0))
        verticalStackView.addArrangedSubview(typesView)
    }
    
    func setViewConstraints() {
        verticalStackView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 8)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: UpcomingMovieCVCell.getHeight()).isActive = true
        
        typesView.translatesAutoresizingMaskIntoConstraints = false
        typesView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func stylizeViews() {
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 8
        
        collectionView.register(cell: UpcomingMovieCVCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension MainPageHeaderViewController {
    static func getHeight() -> CGFloat {
        return UpcomingMovieCVCell.getHeight() + 8 + 8 + 8 + 8 + 80
    }
}
