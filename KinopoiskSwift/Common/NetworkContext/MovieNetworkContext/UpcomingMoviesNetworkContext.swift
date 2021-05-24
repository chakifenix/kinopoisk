//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class UpcomingMoviesNetworkContext: NetworkContext {
    var route: TmdbEndPoint { return .getMoviesUpcoming }
    var method: NetworkMethod { return .get }
    var parameters = [String: Any]()
    
    init(page: Int) {
        parameters["page"] = page
    }
}
