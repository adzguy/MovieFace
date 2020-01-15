//
//  Movie.swift
//  MovieFace
//
//  Created by Davron on 1/14/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import Foundation

struct Movie: Codable, Identifiable {
    var popularity: Float
    var voteCount: Int
    var id: Int
    var voteAverage: Float
    var title: String
    var posterPath: String
    var originalLanguage: String
    var originalTitle: String
    var adult: Bool
    var overview: String
    var releaseDate: String
}
