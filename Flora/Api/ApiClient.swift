//
//  ApiClient.swift
//  Flora
//
//  Created by Rom Dr on 29.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import Foundation

class ApiClient: ObservableObject {
    @Published var records: [TruncatedSpeciesRecord] = []
    
    init() {
       loadSpeciesList()
    }
    
    func loadSpeciesList() {
        guard let url = URL(string: "http://localhost:8080/api/species") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            print(data)
            let resData = try! JSONDecoder().decode([TruncatedSpeciesRecord].self, from: data)
            DispatchQueue.main.async {
                self.records = resData
            }
        }.resume()
    }
}

struct TruncatedSpeciesRecord: Decodable, Identifiable {
    let name: String
    let id: String
    var key: String { get { return id }}
    let description: String
    let frequency: String
}

struct SpeciesRecord: Decodable, Identifiable {
    let id: String
    let name: String
    let ruLocaleName: String    
    let parentId: String
    let hydrophile: String
    let biomorph: String
    let frequency: String
    let complex: String
    let coenotic: String
    let description: String
    var family: Taxon
    var phylum: Taxon
    var locations: Taxon
    var classTaxon: ClassTaxon
    var areal: String
}

protocol Named {
    var name: String { get }
    var ruLocaleName: String  { get }
}

struct Taxon : Named, Decodable {
    var id: String
    var name: String
    var ruLocaleName: String
    var parentId: String
}

struct ClassTaxon : Named, Decodable {
    let name: String
    let ruLocaleName: String
}


enum Hydrophile {
    case XEROPHYTE
}
