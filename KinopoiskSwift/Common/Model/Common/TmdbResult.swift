//
//  TmdbResult.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

struct TmdbResult<T: Decodable>: Decodable {
    let results: Array<T>?
    let total_results: Int?
    let total_pages: Int?
    let page: Int?
}
