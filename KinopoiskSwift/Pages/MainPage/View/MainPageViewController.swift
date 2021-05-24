//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class MainPageViewController: BaseTableViewController {
    
    private lazy var presenter = MainPagePresenter(view: self)
    
    private let searchController = SearchViewController()
    private let headerView = MainPageHeaderView(
        frame: CGRect(x: 0, y: 0, width: screenSize.width, height: MainPageHeaderViewController.getHeight())
    )
    
    private var headerComponents = [MainPageHeaderComponent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadMainPage()
        stylizeViews()
    }
}

extension MainPageViewController: MainPageViewInput {
    func set(headerComponents: [MainPageHeaderComponent]) {
        refreshControl?.endRefreshing()
        self.headerComponents = headerComponents
        tableView.reloadData()
    }
    
    func set(upcomingMovies: [Movie]) {
        refreshControl?.endRefreshing()
        headerView.isHidden = false
        headerView.set(movies: upcomingMovies)
        tableView.reloadData()
    }
}

extension MainPageViewController {
    @objc private func refreshTableView() {
        refreshControl?.beginRefreshing()
        presenter.refreshMainPage()
    }
    
    @objc private func searchButtonTapped() {
        searchController.show(in: self)
    }
}

extension MainPageViewController: SearchViewDelegate {
    func searchView(_ searchView: SearchViewController, didSearchForText text: String) {
        searchController.dismiss(animated: true)
    }
    
    func searchView(_ searchView: SearchViewController, didSelectResultAt index: Int, text: String) {
        
    }
    
    func searchView(_ searchView: SearchViewController, didTextChangeTo text: String, textLength: Int) {
        print(text)
    }
}

extension MainPageViewController: SearchViewDataSource {
    func results() -> [String] {
        return []
    }
}

extension MainPageViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return headerComponents.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headerComponents[section].components.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let component = headerComponents[indexPath.section].components[indexPath.row]
        switch component {
        case .showAllItems(let type):
            let cell: ShowAllItemsTVCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.set(title: type.title)
            return cell
        case .horizontalListItems(let models):
            let cell: HorizontalListItemsTVCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            addChild(cell.viewController)
            cell.set(models: models)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView: SectionHeaderView = tableView.dequeueReusableHeaderFooter()
        sectionView.set(title: headerComponents[section].sectionTitle)
        return sectionView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let component = headerComponents[indexPath.section].components[indexPath.row]
        switch component {
        case .horizontalListItems:
            break
        case .showAllItems(let listType):
            let listItemsViewController = ListItemsViewController(listType: listType)
            navigationController?.pushViewController(listItemsViewController, animated: true)
        }
    }
}

extension MainPageViewController {
    private func stylizeViews() {
        title = "ColdFilm"
        
        searchController.delegate = self
        searchController.dataSource = self
        
        tableView.tableHeaderView = headerView
        addChild(headerView.headerViewController)
        tableView.register(SectionHeaderView.self)
        tableView.register(HorizontalListItemsTVCell.self)
        tableView.register(ShowAllItemsTVCell.self)
        tableView.backgroundColor = AppColor.lightGray.uiColor
        tableView.contentInset.bottom = 40
        
        headerView.isHidden = true
        
        refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl?.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Поиск", style: .plain, target: self, action: #selector(searchButtonTapped))
    }
}
