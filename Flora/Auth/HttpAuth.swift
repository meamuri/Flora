//
//  HttpAuth.swift
//  Flora
//
//  Created by Rom Dr on 28.06.2020.
//  Copyright © 2020 Roman Dronov. All rights reserved.
//

import SwiftUI

struct ServerAuthResponse: Decodable {
    let token: String
}

class HttpAuth: ObservableObject {
    @Published var authentication: String? = nil
    
    func postAuth(username: String, password: String) -> Void {
        guard let url = URL(string: "http://localhost:8080/api/auth/login") else { return }
        let body: [String: String] = ["username": username, "password": password]
        print(body)
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(ServerAuthResponse.self, from: data)
            print(resData.token)
            DispatchQueue.main.async {
                print("good token!")
                self.authentication = resData.token
            }
        }.resume()
    }
}
