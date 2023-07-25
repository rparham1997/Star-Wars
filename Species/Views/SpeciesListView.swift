//
//  ContentView.swift
//  Species
//
//  Created by Ramar Parham on 7/21/23.
//

import SwiftUI

struct SpeciesListView: View {
    @StateObject var speciesVM = SpeciesViewModel()
    
    var body: some View {
        NavigationStack {
            List(speciesVM.speciesArray) { species in
                Text(species.name)
            }
            .font(.title)
            .listStyle(.plain)
            .navigationTitle("Species")
        }
        .task {
            await speciesVM.getData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesListView()
    }
}
