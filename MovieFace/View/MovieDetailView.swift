//
//  MovieDetailView.swift
//  MovieFace
//
//  Created by Davron on 1/14/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI
import URLImage

struct MovieDetailView: View {
    
    var movie: Movie
    let baseImageUrl = "https://image.tmdb.org/t/p/original/"
    
    var body: some View {
        VStack {
            URLImage(URL(string: "\(self.baseImageUrl)\(self.movie.posterPath)")!, delay: 0.25) {proxy in
                proxy.image
                    .resizable()
            }
            .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
            
            HStack {
                Text("Description:")
                    .foregroundColor(.gray)
                Spacer()
            }
            Text(self.movie.overview).lineLimit(nil)
                .padding(.bottom)
            
            HStack{
                Text("Popularity:")
                    .foregroundColor(.gray)
                Text(String(self.movie.popularity)).lineLimit(nil)
                Spacer()
            }
            Spacer()
           
        }
        .padding()
        .navigationBarTitle(Text(movie.title), displayMode: .inline)
            
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//
//
//    static var previews: some View {
//        MovieDetailView(movie: Movie(from: <#T##Decoder#>))
//    }
//}
