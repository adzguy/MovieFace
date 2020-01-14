//
//  ContentView.swift
//  MovieFace
//
//  Created by Davron on 1/14/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            VStack {
                List(networkManager.movies.results) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)){
                        MovieRow(movie: movie)
                    }
                }
            }
            .navigationBarTitle(Text("Movies"))
            .alert(isPresented: $networkManager.showingNetworkError) {
                Alert(title: Text("Error"), message: Text(networkManager.confirmationMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
