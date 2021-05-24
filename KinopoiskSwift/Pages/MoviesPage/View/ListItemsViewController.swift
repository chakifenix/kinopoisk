//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

class ListItemsViewController: BaseTableViewController {
    
    lazy var presenter: ListItemsPresenterInput = ListItemsPresenter(view: self, listType: listType)
   
    private var listType: TmdbPageableListType
    
    private let footerView = SpinnerFooterView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 40))
    
    private var models = [TmdbModel]()
    private var page = 1
    private var maxResult = -1
    
    init(listType: TmdbPageableListType) {
        self.listType = listType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylizeViews()
        presenter.loadItems(page: page)
    }
}

extension ListItemsViewController: ListItemsViewInput {
    func set(models: [TmdbModel]) {
        footerView.hideSpinner()
        self.models = models
        tableView.reloadData()
    }
    
    func set(maxResult: Int) {
        self.maxResult = maxResult
    }
}

extension ListItemsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListItemTVCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.set(model: models[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let isMaxNumberOfItems = models.count == maxResult
        let isLastElement = indexPath.row == models.count - 1
        let isThereInternetConnection = maxResult != -1
        if !isMaxNumberOfItems && isLastElement && isThereInternetConnection {
            footerView.showSpinner()
            page += 1
            presenter.loadItems(page: page)
        }
    }
}

extension ListItemsViewController {
    private func stylizeViews() {
        title = listType.title
        
        tableView.register(ListItemTVCell.self)
        tableView.backgroundColor = AppColor.lightGray.uiColor
        tableView.separatorStyle = .none
        tableView.tableFooterView = footerView
    }
}
