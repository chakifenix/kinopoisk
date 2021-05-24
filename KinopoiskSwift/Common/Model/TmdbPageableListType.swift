//
//  TmdbPageableListType.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

enum TmdbPageableListType {
    // tvShow
    case airingTodayTVShows
    case onTheAirTVShows
    case popularTVShows
    case topRatedTVShows
    
    // movie
    case upcomingMovies
    case topRatedMovies
    case popularMovies
    case nowPlayingMovies
    
    // person
    case popularPersons
    
    var title: String {
        switch self {
        // movie
        case .airingTodayTVShows:
            return "Сегодняшние ТВ-шоу"
        case .onTheAirTVShows:
            return "Уже в эфирах"
        case .popularTVShows:
            return "Популярные ТВ-шоу"
        case .topRatedTVShows:
            return "Список лучших ТВ-шоу"
            
        // tvShow
        case .upcomingMovies:
            return "Скоро в кино"
        case .topRatedMovies:
            return "Список лучших фильмов"
        case .popularMovies:
            return "Популярные фильмы"
        case .nowPlayingMovies:
            return "Сегодня в кино"
            
        // person
        case .popularPersons:
            return "Популярные актеры"
        }
    }
    
    func getNetworkContext(page: Int) -> NetworkContext {
        switch self {
        // tvShow
        case .airingTodayTVShows:
            return AiringTodayTVShowsNetworkContext(page: page)
        case .onTheAirTVShows:
            return OnTheAirTVShowsNetworkContext(page: page)
        case .popularTVShows:
            return PopularTVShowsNetworkContext(page: page)
        case .topRatedTVShows:
            return TopRatedTVShowsNetworkContext(page: page)
            
        // movie
        case .upcomingMovies:
            return UpcomingMoviesNetworkContext(page: page)
        case .topRatedMovies:
            return TopRatedMoviesNetworkContext(page: page)
        case .popularMovies:
            return PopularMoviesNetworkContext(page: page)
        case .nowPlayingMovies:
            return NowPlayingMoviesNetworkContext(page: page)
            
        // person
        case .popularPersons:
            return PopularPersonsNetworkContext(page: page)
        }
    }
    
    var modelType: TmdbModelType {
        switch self {
        case .airingTodayTVShows, .onTheAirTVShows, .popularTVShows, .topRatedTVShows:
            return .tvShow
        case .upcomingMovies, .topRatedMovies, .popularMovies, .nowPlayingMovies:
            return .movie
        case .popularPersons:
            return .actor
        }
    }
}
