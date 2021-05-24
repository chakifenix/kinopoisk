//
//  TmdbModelWrapper.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

struct TmdbModelWrapper: Decodable {
    
    let model: TmdbMovieTVShowModel?
    
    private enum CodingKeys: String, CodingKey {
        case media_type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(MediaType.self, forKey: .media_type)
        self.model = try type.metatype.init(from: decoder)
    }
}
