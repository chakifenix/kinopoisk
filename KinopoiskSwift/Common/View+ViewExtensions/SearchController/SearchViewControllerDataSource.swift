//
//  SearchViewControllerDataSource.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

public protocol SearchViewDataSource {
    ///results is called whenever the UITableView's data source functions `cellForRowAt` and `numberOfRowsInSection` and when calling `reloadData()` on an instance of `AZSearchViewController`.
    /// - returns: An array of strings which are displayed as a auto-complete suggestion.
    func results()->[String]
    
    ///Optional function, override if you wish to dequeue a custom cell class.
    func searchView(_ searchView: SearchViewController, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    ///Optional function, override if you want to allow a cell to be edited.
    func searchView(_ searchView: SearchViewController, tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    
    func searchView(_ searchView: SearchViewController, tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    
    func statusBarStyle()-> UIStatusBarStyle
    
}

//This extension is used to make the function optional
public extension SearchViewDataSource {
    func searchView(_ searchView: SearchViewController,tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: searchView.cellIdentifier)
        cell?.textLabel?.text = results()[indexPath.row]
        return cell!
    }
    
    func searchView(_ searchView: SearchViewController,tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func searchView(_ searchView: SearchViewController, tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){}
    
    func statusBarStyle()-> UIStatusBarStyle {return .default}
    
}
