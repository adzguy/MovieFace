//
//  NetworkManager.swift
//  MovieFace
//
//  Created by Davron on 1/14/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import Foundation
//import Alamofire
import Combine

class NetworkManager: ObservableObject {
    @Published var movies = MovieList(results: [])
    @Published var showingNetworkError = false
    @Published var confirmationMessage = ""
    
    private let apiKey = "32cbd53f4bc581422d7d1056a83db2ec"
    private let apiUrlBase = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
    
    init() {
        loadData()
    }
    
    private func loadData() {
        guard let url = URL(string: "\(apiUrlBase)\(apiKey)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                self.showingNetworkError = true
                self.confirmationMessage = "\(error?.localizedDescription.lowercased() ?? "Unknown error")."
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let decodedMovies = try? decoder.decode(MovieList.self, from: data) {
                DispatchQueue.main.async {
                    self.movies = decodedMovies
                    self.showingNetworkError = false
                }
            }
            else {
                print("Invalid response from server")
            }
        }.resume()
    }
}
