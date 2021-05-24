//
//  SMImage.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

struct SMImage: Codable {
    // aspect_ratio: Number
    let file_path: String?
    let height: Int?
    let width: Int?
    let iso_639_1: String?
    let vote_average: Int?
    let vote_count: Int?
}
