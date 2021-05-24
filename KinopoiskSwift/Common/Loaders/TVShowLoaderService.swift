//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class TVShowLoaderService {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadAiringTodayTVShows(page: Int, completion: @escaping (Result<[TVShow]>) -> Void) {
        let networkContext = AiringTodayTVShowsNetworkContext(page: page)
        loadTVShows(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    func loadOnTheAirTVShows(page: Int, completion: @escaping (Result<[TVShow]>) -> Void) {
        let networkContext = OnTheAirTVShowsNetworkContext(page: page)
        loadTVShows(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    func loadPopularTVShows(page: Int, completion: @escaping (Result<[TVShow]>) -> Void) {
        let networkContext = PopularTVShowsNetworkContext(page: page)
        loadTVShows(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    func loadTopRatedTVShows(page: Int, completion: @escaping (Result<[TVShow]>) -> Void) {
        let networkContext = TopRatedTVShowsNetworkContext(page: page)
        loadTVShows(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    private func loadTVShows(networkContext: NetworkContext, completion: @escaping (Result<[TVShow]>) -> Void) {
        networkService.loadDecodable(context: networkContext, type: TmdbResult<TVShow>.self) { result in
            switch result {
            case .success(let tmdbResult):
                guard let movies = tmdbResult.results else {
                    completion(.error(NetworkError.dataLoad))
                    return
                }
                completion(.success(movies))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
