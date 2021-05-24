//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class MovieLoaderService {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadNowPlayingMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let networkContext = NowPlayingMoviesNetworkContext(page: page)
        loadMovies(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    func loadUpcomingMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let networkContext = UpcomingMoviesNetworkContext(page: page)
        loadMovies(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    func loadPopularMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let networkContext = PopularMoviesNetworkContext(page: page)
        loadMovies(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    func loadTopRatedMovies(page: Int, completion: @escaping (Result<[Movie]>) -> Void) {
        let networkContext = TopRatedMoviesNetworkContext(page: page)
        loadMovies(networkContext: networkContext) { result in
            completion(result)
        }
    }
    
    private func loadMovies(networkContext: NetworkContext, completion: @escaping (Result<[Movie]>) -> Void) {
        networkService.loadDecodable(context: networkContext, type: TmdbResult<Movie>.self) { result in
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
