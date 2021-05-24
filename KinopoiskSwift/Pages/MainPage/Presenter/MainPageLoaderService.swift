//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

class MainPageLoaderService {
    
    private let networkService: NetworkService
    
    private lazy var movieLoaderService = MovieLoaderService(networkService: networkService)
    private lazy var tvShowLoaderService = TVShowLoaderService(networkService: networkService)
    private lazy var personLoaderService = PersonLoaderService(networkService: networkService)
    
    private let mainPageComponentsStore: MainPageComponentsStore
    
    init(networkService: NetworkService, mainPageComponentsStore: MainPageComponentsStore) {
        self.networkService = networkService
        self.mainPageComponentsStore = mainPageComponentsStore
    }
    
    func loadMainPage(onCompletion perform: @escaping (Result<Void>) -> Void) {
        let dispatchGroup = DispatchGroup()
        
        loadMainPageToComponentsStore(dispatchGroup: dispatchGroup) { results in
            dispatchGroup.notify(queue: .main) {
                for result in results {
                    switch result {
                    case .success:
                        continue
                    case .error:
                        perform(result)
                        return
                    }
                }
                perform(.success(()))
            }
        }
    }
    
    private func loadMainPageToComponentsStore(dispatchGroup: DispatchGroup, completion: ([Result<Void>]) -> Void) {
        var results = [Result<Void>]()
        
        dispatchGroup.enter()
        loadUpcomingMoviesToComponentsStore { result in
            results.append(result)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        loadNowPlayingMoviesToComponentsStore { result in
            results.append(result)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        loadAiringTodayTVShowsToComponentsStore { result in
            results.append(result)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        loadPopularPeersonsToComponentsStore { result in
            results.append(result)
            dispatchGroup.leave()
        }
        
        completion(results)
    }
    
    private func loadUpcomingMoviesToComponentsStore(completion: @escaping (Result<Void>) -> Void) {
        movieLoaderService.loadUpcomingMovies(page: 1) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movies):
                strongSelf.mainPageComponentsStore.upcomingMovies = movies
                completion(.success(()))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    private func loadNowPlayingMoviesToComponentsStore(completion: @escaping (Result<Void>) -> Void) {
        movieLoaderService.loadNowPlayingMovies(page: 1) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movies):
                strongSelf.mainPageComponentsStore.nowPlayingMovies = movies
                completion(.success(()))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    private func loadAiringTodayTVShowsToComponentsStore(completion: @escaping (Result<Void>) -> Void) {
        tvShowLoaderService.loadAiringTodayTVShows(page: 1) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let tvShows):
                strongSelf.mainPageComponentsStore.airingTodayTVShows = tvShows
                completion(.success(()))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
    
    private func loadPopularPeersonsToComponentsStore(completion: @escaping (Result<Void>) -> Void) {
        personLoaderService.loadPopularPersons(page: 1) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let persons):
                strongSelf.mainPageComponentsStore.popularPersons = persons
                completion(.success(()))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
