//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

import Foundation

protocol NetworkResponse {
    var data: Data? { get }
    var networkError: NetworkError? { get }
}

extension NetworkResponse {
    func decode<T: Decodable>() -> T? {
        guard let data = data else { return nil }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            dump(error)
            return nil
        }
    }
}
