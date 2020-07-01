//
//  FloraView.swift
//  Flora
//
//  Created by Rom Dr on 29.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import SwiftUI

struct FloraView: View {
    @ObservedObject var apiClient: ApiClient
    
    var body: some View {        
        NavigationView {
            List {
                ForEach(self.apiClient.records) { e in
                    NavigationLink(destination: FloraDetails(species: e)) {
                        FloraRow(name
                            : e.name)
                    }
                }
            }
        }
    }
}

struct FloraRow: View {
    var name: String
    var body: some View {
        Text("☘️☘️ \(name)")
    }
}

struct FloraDetails: View {
    var species: TruncatedSpeciesRecord
    var body: some View {
        VStack {
            Text(species.name)
            Text(species.frequency)
            Text(species.description)
        }
    }
}

struct FloraView_Previews: PreviewProvider {
    static var previews: some View {
        FloraView(apiClient: ApiClient())
    }
}
