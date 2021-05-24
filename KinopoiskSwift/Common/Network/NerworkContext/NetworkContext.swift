//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

protocol NetworkContext: class {
    var route: TmdbEndPoint { get }
    var method: NetworkMethod { get }
    var encoding: NetworkEncoding { get }
    var parameters: [String: Any] { get set }
}

extension NetworkContext {
    
    var url: URL? { return route.url() }
    
    var parameters: [String: Any] { return [:] }
    
    var encoding: NetworkEncoding { return .url }
    
    func setDefaultParameters() {
        setApiKey()
        setDefaultLanguage()
    }
    
    func setApiKey() {
        parameters["api_key"] = TmdbAPI.apiKey
    }
    
    func setDefaultLanguage() {
        parameters["language"] = TmdbAPI.language
    }
}
