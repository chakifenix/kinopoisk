//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class PopularPersonsNetworkContext: NetworkContext {
    var route: TmdbEndPoint { return .getPersonsPopular }
    var method: NetworkMethod { return .get }
    var parameters = [String: Any]()
    
    init(page: Int) {
        parameters["page"] = page
    }
}
