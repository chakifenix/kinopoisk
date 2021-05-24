//
//  TmdbModel.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

protocol TmdbModel: Decodable {
    var id: Int? { get }
    
    func getTitle() -> String?
    func getSubtitle() -> String?
    func getPosterPathUrlString() -> String?
    func getModelType() -> TmdbModelType
}
