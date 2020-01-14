//
//  ContentView.swift
//  MovieFace
//
//  Created by Davron on 1/14/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network = Network()

    var body: some View {
        NavigationView {
            VStack {
                List(network.movies.results) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)){
                        MovieRow(movie: movie)
                    }
                }
            }
            .navigationBarTitle(Text("Movies"))
            .alert(isPresented: $network.showingNetworkError) {
                Alert(title: Text("Error"), message: Text(network.confirmationMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
