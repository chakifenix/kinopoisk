//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class TopRatedMoviesNetworkContext: NetworkContext {
    var route: TmdbEndPoint { return .getMoviesTopRated }
    var method: NetworkMethod { return .get }
    var parameters = [String: Any]()
    
    init(page: Int) {
        parameters["page"] = page
    }
}
