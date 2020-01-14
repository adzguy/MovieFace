//
//  MovieRow.swift
//  MovieFace
//
//  Created by Davron on 1/14/20.
//  Copyright © 2020 Davron. All rights reserved.
//
import URLImage
import SwiftUI

struct MovieRow : View {
    var movie: Movie
    var baseImageUrl = "https://image.tmdb.org/t/p/original/"
    var body: some View {
        HStack {
            URLImage(URL(string: "\(baseImageUrl)\(movie.posterPath)")!, delay: 0.25) { proxy in
                proxy.image
                    .resizable()
            }
            .frame(width: 90, height: 120)
            
            VStack {
                Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    Spacer()
                }
                .padding(.bottom)
                HStack {
                    Text(movie.releaseDate)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("Rate: \(movie.voteAverage.format())")
                }
                HStack {
                    Text("Vote count: \(movie.voteCount)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(movie.popularity)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}

extension Float {
    func format() -> String {
        return String(format: "%.2f",self)
    }
}
//struct MovieRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieRow()
//    }
//}
