//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class PersonLoaderService {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadPopularPersons(page: Int, completion: @escaping (Result<[Person]>) -> Void) {
        let networkContext = PopularPersonsNetworkContext(page: page)
        networkService.loadDecodable(context: networkContext, type: TmdbResult<Person>.self) { result in
            switch result {
            case .success(let tmdbResult):
                guard let persons = tmdbResult.results else {
                    completion(.error(NetworkError.dataLoad))
                    return
                }
                completion(.success(persons))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
