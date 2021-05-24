//
//  SearchViewDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import UIKit

public protocol SearchViewDelegate {
    
    ///didTextChange is called once the user types/deletes.
    /// - parameter searchView: Is the current instance of AZSearchViewController.
    /// - parameter text: Is the new text.
    /// - parameter textLength: Is the length of the new text.
    func searchView(_ searchView: SearchViewController, didTextChangeTo text: String, textLength: Int)
    
    ///didSearch is called once the user clicks the `Search` button in the keyboard.
    /// - parameter searchView: Is the current instance of AZSearchViewController.
    /// - parameter text: Is the text that the user is searching for.
    func searchView(_ searchView: SearchViewController, didSearchForText text: String)
    
    ///didSelectResult is called once the user has selected one of the results in the table view.
    /// - parameter searchView: Is the current instance of AZSearchViewController.
    /// - parameter index: Is the index of the item that was selected.
    /// - parameter text: Is the text of the selected result. Note that this is fetched from the data source, so if the data source function `results()` has changed it's data set this will return the new data.
    func searchView(_ searchView: SearchViewController, didSelectResultAt index: Int,text: String)
    
    /// Called when controller has been dismissed.
    ///
    /// - Parameters:
    ///   - searchView: The current instance of AZSearchViewController.
    ///   - text: Is the text.
    func searchView(_ searchView: SearchViewController, didDismissWithText text: String)
    
    ///Optional function, override if you wish to add custom actions to your cells.
    func searchView(_ searchView: SearchViewController, tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]?
    
    ///Optional function, override if you wish to modify the height of each row.
    func searchView(_ searchView: SearchViewController, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
}

public extension SearchViewDelegate {
    
    func searchView(_ searchView: SearchViewController, didDismissWithText text: String) {}
    
    func searchView(_ searchView: SearchViewController,tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        return []
    }
    
    func searchView(_ searchView: SearchViewController, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SearchViewDefaults.cellHeight
    }
}
