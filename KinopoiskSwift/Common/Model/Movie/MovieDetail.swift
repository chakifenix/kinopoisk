//
//  MovieDetail.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

struct MovieDetail: Codable {
    let id: Int
    let title: String?
    let original_title: String?
    let vote_average: Double?
    let vote_count: Int?
    let overview: String?
    let popularity: Double?
    let backdrop_path: String?
    let poster_path: String?
    
    let budget: Int?
    let genres: Array<Genre>?
    let production_companies: Array<ProductionCompany>?
    let production_countries: Array<ProductionCountry>?
    let spoken_languages: Array<SpokenLanguages>?
    let release_date: String?
    let revenue: Int?
    let runtime: Int?
    let status: String?
    let tagline: String?
}

extension MovieDetail {
    func getGenres() -> String? {
        if let genres = genres, !genres.isEmpty {
            return genres.compactMap { $0.name }.joined(separator: ", ")
        } else {
            return nil
        }
    }
    
    func runtimeToString() -> String? {
        if let duration = runtime {
            let minutes = duration % 60;
            let hours = duration / 60
            return "\(hours)hr \(minutes)min"
        }
        return nil
    }
}
