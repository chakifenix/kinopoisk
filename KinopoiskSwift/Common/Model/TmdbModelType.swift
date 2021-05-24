//
//  TmdbModelType.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

enum TmdbModelType {
    case actor
    case movie
    case tvShow
    
    var title: String {
        switch self {
        case .actor:
            return "Люди"
        case .movie:
            return "Фильмы"
        case .tvShow:
            return "ТВ-шоу"
        }
    }
}
