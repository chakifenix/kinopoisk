//
//  MediaType.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

enum MediaType: String, Codable {
    case tv
    case movie
    
    var metatype: TmdbMovieTVShowModel.Type {
        switch self {
        case .tv:
            return TVShow.self
        case .movie:
            return Movie.self
        }
    }
}
