//
//  Person.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

struct Person {
    let profile_path: String?
    let adult: Bool?
    let id: Int?
    let name: String?
    let popularity: Double?
    let known_for: [TmdbModelWrapper]?
}

extension Person: TmdbModel {
    func getTitle() -> String? {
        return name
    }
    
    func getSubtitle() -> String? {
        return nil
    }
    
    func getPosterPathUrlString() -> String? {
        if let profilePath = profile_path {
            return TmdbAPI.posterPath + profilePath
        }
        return nil
    }
    
    func getModelType() -> TmdbModelType {
        return .actor
    }
}
